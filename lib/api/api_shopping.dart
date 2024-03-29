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

  Future<List<ShoppingModel>> getShopping() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid;

    // Obtenemos una referencia a la base de datos de Firestore
    final firestore = FirebaseFirestore.instance;

    // Obtenemos todos los documentos de la colección 'shopping' que tienen el 'uid' especificado
    final querySnapshot = await firestore
        .collection('shopping')
        .where('uid', isEqualTo: uid)
        .get();

    // Convertimos cada documento a un objeto ShoppingModel y los agregamos a una lista
    final shoppingList = querySnapshot.docs.map((doc) {
      return ShoppingModel.fromJson({
        'id': doc.id, // Asegúrate de incluir el id del documento
        ...doc.data(),
      });
    }).toList();

    return shoppingList;
  }
}
