import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> updatePassword(String password) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        await user.updatePassword(password);
      }
      return {'success': true, 'message': 'Contraseña actualizada'};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return {
          'success': false,
          'message': 'La contraseña es demasiado débil'
        };
      } else if (e.code == 'requires-recent-login') {
        return {
          'success': false,
          'message':
              'Para cambiar la contraseña, debes iniciar sesión de nuevo'
        };
      } else {
        return {'success': false, 'message': e.toString()};
      }
    }
  }

  Future<void> loginAgain() async {
    await auth.signOut();
    final userModel = UserModel.instance();
    final email = userModel.email;
    final password = await GeneralUtils.getPassword();
    await signIn(email!, password!);
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return {
        'user': user,
        'success': true,
      };
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return {
          'user': null,
          'success': false,
          'message': 'Usuario no encontrado'
        };
      }
      if (e.code == 'invalid-credential') {
        return {
          'user': null,
          'success': false,
          'message': 'Contraseña o email incorrectos'
        };
      }
      return {'user': null, 'success': false, 'message': e.message};
    }
  }

  sendresetPasswordEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  signOut() async {
    await auth.signOut();
  }

  //delete user account
  Future<Map<String, dynamic>> deleteUser() async {
    try {
      await auth.currentUser!.delete();
      return {'success': true, 'message': 'Cuenta eliminada'};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return {
          'success': false,
          'message': 'Se requiere inicio de sesión reciente'
        };
      }
      return {'success': false, 'message': e.message};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  // sendSignInLinkToEmail(String email, ActionCodeSettings actionCodeSettings) async {
  //   await auth.sendSignInLinkToEmail(email: email, actionCodeSettings: actionCodeSettings);
  // }

  //user is signed in
  bool isSignedIn() {
    return auth.currentUser != null;
  }

  Future<UserModel?> getDataUser(String uid) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return UserModel.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> checkStatus() async {
    if (isSignedIn()) {
      UserModel? user = await getDataUser(auth.currentUser!.uid);
      if (user != null) {
        UserModel.instance().setData(user);
      }
      return {'success': true, 'user': user};
    } else {
      UserModel.instance().resetData();
      return {'success': false, 'user': null};
    }
  }

  Future<Map<String, dynamic>> registerUser(
      String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return {'user': user, 'success': true, 'message': 'Registro exitoso'};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return {
          'success': false,
          'message': 'La contraseña es demasiado débil'
        };
      } else if (e.code == 'email-already-in-use') {
        return {
          'success': false,
          'message': 'El correo electrónico ya está en uso'
        };
      } else {
        return {'success': false, 'message': 'Error al registrar usuario'};
      }
    }
  }

  Future<void> addUsers(ClientModel user, String uid,
      {bool isClient = false}) async {
    await FirebaseFirestore.instance.collection('users').doc(user.id).set({
      'uid': uid,
      'name': user.name.value,
      'lastName': user.lastName.value,
      'email': user.email.value,
      'role': isClient ? 'client' : 'seller',
      'isActive': true,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }
}
