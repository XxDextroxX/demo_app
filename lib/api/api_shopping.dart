import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiShopping {
  Future<void> addShopping(List<ProductModel> products) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final id = auth.currentUser?.uid;

    // Convertimos cada producto a un mapa usando toJson() antes de guardarlos en Firestore
    final productsMap = products.map((product) => product.toJson()).toList();

    await FirebaseFirestore.instance.collection('shopping').doc(null).set({
      'uid': id,
      'products': productsMap,
      'createdAt': DateTime.now().toString(),
    });
  }

  Stream<List<ShoppingModel>> getShoppingRealTime() {
    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid;

    final firestore = FirebaseFirestore.instance;
    final query = firestore
        .collection('shopping')
        .where('uid', isEqualTo: uid)
        .snapshots();

    return query.map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ShoppingModel.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    });
  }
}
