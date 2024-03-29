import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class ApiProducts {
  Future<void> addProduct(
    ProductModel model,
    List<String>? images,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final id = auth.currentUser?.uid;
    await FirebaseFirestore.instance.collection('products').doc(model.id).set({
      'uid': id,
      'name': model.name,
      'price': model.price,
      'stock': model.stock,
      'images': images,
      'createdAt': DateTime.now().toString(),
      'isSold': false
    });
  }

  Future<List<String>> uploadImages(List<File> images) async {
    List<String> imageUrls = [];
    for (File image in images) {
      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}.${image.path.split('.').last}';
      Reference reference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot storageTaskSnapshot = await uploadTask;
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }

    return imageUrls;
  }

  Future<List<ProductModel>> getProducts({bool getAll = false}) async {
    final uidUser = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot querySnapshot;
    if (getAll) {
      querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .orderBy('createdAt', descending: true)
          .get();
    } else {
      querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('uid', isEqualTo: uidUser)
          .orderBy('createdAt', descending: false)
          .get();
    }
    return querySnapshot.docs.map((doc) {
      return ProductModel(
        id: doc.id,
        uid: doc['uid'],
        name: doc['name'],
        price: doc['price'].toDouble(),
        stock: doc['stock'],
        images: List<String>.from(doc['images'] ?? []),
        createdAt: doc['createdAt'],
        isSold: doc['isSold'] ?? false,
      );
    }).toList();
  }

  Future<bool> checkAndBuyProducts(
      BuildContext context, List<ProductModel> products) async {
    try {
      // Obtenemos una referencia a la base de datos de Firestore
      final firestore = FirebaseFirestore.instance;
      // Iniciamos una transacción de escritura en Firestore
      return firestore.runTransaction<bool>((transaction) async {
        // Primero, realizamos todas las operaciones de lectura
        List<DocumentSnapshot> productDocs = [];
        for (var product in products) {
          final productRef = firestore.collection('products').doc(product.id);
          final productDoc = await transaction.get(productRef);
          productDocs.add(productDoc);
        }

        // Luego, realizamos todas las operaciones de escritura
        for (int i = 0; i < products.length; i++) {
          var product = products[i];
          var productDoc = productDocs[i];

          if (!productDoc.exists) {
            CustomSnackbar.showSnackBar(
              'Error al agregar el producto ${product.name}',
              // ignore: use_build_context_synchronously
              context,
              isSuccess: false,
            );
            return false;
          }

          final productData = productDoc.data() as Map<String, dynamic>;
          final currentStock = productData['stock'];

          if (currentStock < product.stock) {
            CustomSnackbar.showSnackBar(
              'Stock insuficiente para el producto ${product.name}',
              // ignore: use_build_context_synchronously
              context,
              isSuccess: false,
            );
            return false;
          }
          transaction.update(productDoc.reference, {
            'stock': currentStock - product.stock,
            'isSold': currentStock == product.stock,
          });
        }

        return true;
      });
    } catch (e) {
      // Si ocurre algún error, mostramos un mensaje de error y retornamos false
      CustomSnackbar.showSnackBar(
        'Error al realizar la compra',
        context,
        isSuccess: false,
      );
      return false;
    }
  }
}
