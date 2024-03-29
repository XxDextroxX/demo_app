import 'package:demo_app/models/models.dart';

class ShoppingModel {
  String? id;
  String? uid;
  List<ProductModel>? products;
  String? createdAt;

  ShoppingModel({
    this.id,
    this.uid,
    this.products,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'products': products?.map((product) => product.toJson()).toList(),
      'createdAt': createdAt,
    };
  }

  factory ShoppingModel.fromJson(Map<String, dynamic> json) {
    return ShoppingModel(
      id: json['id'],
      uid: json['uid'],
      products: json['products'] != null
          ? List<ProductModel>.from(
              json['products'].map((product) => ProductModel.fromJson(product)))
          : null,
      createdAt: json['createdAt'],
    );
  }
}
