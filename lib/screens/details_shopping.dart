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
                trailing: Text(
                  GeneralUtils.timeAgo(model.createdAt ?? ''),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.products!.length,
                itemBuilder: (BuildContext context, int index) {
                  return _ViewDetailsShopping(model: model.products![index]);
                },
              )
            ],
          ),
        ));
  }
}

class _ViewDetailsShopping extends StatelessWidget {
  const _ViewDetailsShopping({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _information(model),
          Container(
            height: 250,
            width: size.width * 0.95,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: model.images!.map((e) => _image(e)).toList(),
              ),
            ),
          ),
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
          const Divider(),
          _text('Nombre:', product.name ?? ''),
          _text(
            'Precio:',
            GeneralUtils.getAmoutFormat(product.price ?? 0),
          ),
          _text('Cantidad', product.stock.toString()),
          _text('Total:',
              GeneralUtils.getAmoutFormat(product.price! * product.stock!)),
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
