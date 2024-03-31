import 'package:demo_app/api/api.dart';
import 'package:demo_app/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_product.g.dart';

@riverpod
Stream<List<ProductModel>> getProductsRealTime(GetProductsRealTimeRef ref,
    {bool getAll = true}) {
  final api = ApiProducts();
  final response = api.getProductsRealTime(getAll: getAll);
  return response;
}
