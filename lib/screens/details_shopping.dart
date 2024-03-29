import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class DetailsShopping extends StatelessWidget {
  const DetailsShopping({super.key, required this.model});
  final ShoppingModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles de la compra'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Fecha de compra:'),
                subtitle: Text(model.createdAt.toString().substring(0, 10)),
                trailing: Text(GeneralUtils.timeAgo(model.createdAt ?? '')),
              ),
              _ViewDetailsShopping(model: model),
            ],
          ),
        ));
  }
}

class _ViewDetailsShopping extends StatelessWidget {
  const _ViewDetailsShopping({super.key, required this.model});
  final ShoppingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: model.products!
                    .expand(
                        (product) => product.images!.map((url) => _image(url)))
                    .toList(),
              ),
            ),
          ),
          Column(
            children: model.products!
                .map((product) => _information(product))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _image(String url) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 220,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            image: NetworkImage(
              url,
            ),
            fit: BoxFit.contain,
            placeholder: AssetImage(
              AssetsName.noImage,
            ),
          ),
        ),
      ),
    );
  }

  Widget _information(ProductModel product) {
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
          _text('Total:',
              GeneralUtils.getAmoutFormat(product.price! * product.stock!)),
          const Divider()
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
