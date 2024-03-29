class ProductModel {
  String? id;
  String? uid;
  String? name;
  double? price;
  int? stock;
  String? createdAt;
  List<String>? images;
  bool isSold;

  ProductModel({
    this.id,
    this.uid,
    this.name,
    this.price,
    this.stock,
    this.createdAt,
    this.images,
    this.isSold = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      price: json['price'],
      stock: json['stock'],
      createdAt: json['createdAt'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      isSold: json['isSold'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'price': price,
      'stock': stock,
      'createdAt': createdAt,
      'images': images,
      'isSold': isSold
    };
  }
}
