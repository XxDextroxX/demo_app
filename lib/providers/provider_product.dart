import 'package:demo_app/api/api.dart';
import 'package:demo_app/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_product.g.dart';

@riverpod
Future<List<ProductModel>> getProducts(GetProductsRef ref,
    {bool updateStateAux = true}) async {
  List<ProductModel> response = [];
  final api = ApiProducts();
  response = await api.getProducts();
  return response;
}

@riverpod
Future<List<ProductModel>> getAllProducts(GetAllProductsRef ref,
    {bool updateStateAux = true}) async {
  List<ProductModel> response = [];
  final api = ApiProducts();
  response = await api.getProducts(getAll: true);
  return response;
}

@riverpod
class UpdateState extends _$UpdateState {
  @override
  bool build() {
    return true;
  }

  void update() {
    state = !state;
  }
}
