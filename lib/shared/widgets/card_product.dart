import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/product_model.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardProduct extends ConsumerWidget {
  const CardProduct({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listShoppingNotifier = ref.watch(listShoppingProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color:
                model.stock! > 0 ? Theme.of(context).primaryColor : Colors.red),
      ),
      child: Stack(
        children: [
          _addProduct(context, listShoppingNotifier),
          _image(model.images![0]),
          _data(model.name ?? '', model.price ?? 0),
        ],
      ),
    );
  }

  Widget _data(String name, double price) {
    return Positioned(
      top: 220,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              name,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Text(
            GeneralUtils.getAmoutFormat(price),
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _image(String url) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              image: NetworkImage(
                url,
              ),
              fit: BoxFit.cover,
              placeholder: AssetImage(
                AssetsName.noImage,
              ),
            ),
          ),
        ));
  }

  Widget _addProduct(BuildContext context, ListShopping listShoppingNotifier) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: model.stock! > 0
                  ? Theme.of(context).primaryColor
                  : Colors.red,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: IconButton(
            onPressed: () async {
              if (model.stock! <= 0) {
                CustomSnackbar.showSnackBar(
                  'No hay stock',
                  context,
                  isSuccess: false,
                );
                return;
              }
              final newModel = ProductModel(
                id: model.id,
                uid: model.uid,
                name: model.name,
                price: model.price,
                stock: 1,
                images: model.images,
                createdAt: model.createdAt,
              );
              final response = listShoppingNotifier.addProduct(newModel);
              CustomSnackbar.showSnackBar(
                response ? 'Producto agregado' : 'El producto ya fue agregado',
                context,
                isSuccess: response,
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }
}
