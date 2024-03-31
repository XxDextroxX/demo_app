import 'package:demo_app/api/api.dart';
import 'package:demo_app/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_provider.g.dart';

@riverpod
class ListShopping extends _$ListShopping {
  List<ProductModel> products = [];
  @override
  List<ProductModel> build() {
    return products;
  }

  //add product
  bool addProduct(ProductModel product) {
    if (state.any((element) => element.id == product.id)) {
      // El producto ya existe en la lista
      return false;
    } else {
      // El producto no existe en la lista, así que lo agregamos
      state = [...state, product];
      return true;
    }
  }

  //remove product
  void removeProduct(ProductModel product) {
    state = state.where((element) => element.id != product.id).toList();
  }

  void reset() {
    state = [];
  }

  //update stock
  void updateStock(int index, int stock) {
    state[index].stock = stock;
  }
}

@riverpod
class AddShopping extends _$AddShopping {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}

@riverpod
class TotalToPay extends _$TotalToPay {
  @override
  double build() {
    return 0;
  }

  void increment(double value) {
    state += value;
  }

  void decrement(double value) {
    state -= value;
  }

  void reset() {
    state = 0;
  }

  void updateTotal(List<ProductModel> listShopping) {
    state = listShopping.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.stock! * element.price!));
  }
}

@riverpod
Stream<List<ShoppingModel>> getShopping(GetShoppingRef ref) {
  final api = ApiShopping();
  final response = api.getShoppingRealTime();
  return response;
}
