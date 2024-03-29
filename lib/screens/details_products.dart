import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsProduct extends ConsumerWidget {
  const DetailsProduct({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listShoppingNotifier = ref.watch(listShoppingProvider.notifier);
    final addShopping = ref.watch(addShoppingProvider);
    final addShoppingNotifier = ref.watch(addShoppingProvider.notifier);
    final userModel = UserModel.instance();
    final isClient = userModel.role == 'client';
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSliderWidget(
                images: product.images ?? [],
              ),
              const SizedBox(
                height: 20,
              ),
              _information(),
              const SizedBox(
                height: 20,
              ),
              if (isClient) ShopProducts(cuantity: product.stock ?? 0),
              if (product.stock! > 0 && isClient)
                CustomFilledButtonWithIcon(
                  iconSize: 30,
                  height: 70,
                  text: 'Añadir al carrito',
                  icon: Icons.add_shopping_cart_outlined,
                  onPressed: () {
                    if (addShopping == 0) {
                      return;
                    }
                    final model = ProductModel(
                      id: product.id,
                      uid: product.uid,
                      name: product.name,
                      price: product.price,
                      stock: addShopping,
                      images: product.images,
                      createdAt: product.createdAt,
                    );
                    final response = listShoppingNotifier.addProduct(model);
                    CustomSnackbar.showSnackBar(
                      response
                          ? 'Producto agregado'
                          : 'El producto ya fue agregado',
                      context,
                      isSuccess: response,
                    );
                    addShoppingNotifier.reset();
                    Navigator.pop(context);
                  },
                )
              else if (product.stock! <= 0 && isClient)
                const Text(
                  'Sin stock',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _information() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text('Nombre:', product.name ?? ''),
          _text(
            'Precio:',
            GeneralUtils.getAmoutFormat(product.price ?? 0),
          ),
          _text('Cantidad', product.stock.toString()),
        ],
      ),
    );
  }

  Widget _text(String text, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      trailing: const Icon(Icons.info),
    );
  }
}
