import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListProducts extends ConsumerStatefulWidget {
  const ListProducts({
    super.key,
    required this.model,
    required this.index,
  });
  final ProductModel model;
  final int index;

  @override
  ListProductsState createState() => ListProductsState();
}

class ListProductsState extends ConsumerState<ListProducts> {
  int stock = 0;
  String price = '0.0';

  @override
  void initState() {
    stock = widget.model.stock!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listShoppingNotifier = ref.watch(listShoppingProvider.notifier);
    final getTotalToPayNotifier = ref.watch(totalToPayProvider.notifier);
    final listShopping = ref.watch(listShoppingProvider);
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          _imageProduct(widget.model.images?[0] ?? ''),
          Positioned(
              top: 40,
              left: 130,
              child: SizedBox(
                width: 150,
                child: Text(
                  widget.model.name ?? '',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )),
          Positioned(
              top: 70,
              left: 130,
              child: _editProduct(
                  listShoppingNotifier, getTotalToPayNotifier, listShopping)),
          _details(
            listShoppingNotifier,
          )
        ],
      ),
    );
  }

  Widget _details(
    ListShopping listShoppingNotifier,
  ) {
    price = GeneralUtils.getAmoutFormat((widget.model.price! * stock));
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10),
        child: Column(
          children: [
            Text(
              price,
            ),
            IconButton(
                onPressed: () {
                  listShoppingNotifier.removeProduct(widget.model);
                },
                icon: const Icon(
                  Icons.delete,
                ))
          ],
        ),
      ),
    );
  }

  Widget _editProduct(
    ListShopping listShoppingNotifier,
    TotalToPay getTotalToPayNotifier,
    List<ProductModel> listShopping,
  ) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (stock > 1) {
                stock--;
                setState(() {});
                listShoppingNotifier.updateStock(widget.index, stock);
                getTotalToPayNotifier.updateTotal(listShopping);
              }
            },
            icon: const Icon(
              Icons.remove,
              size: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            stock.toString(),
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              stock++;
              setState(() {});
              listShoppingNotifier.updateStock(widget.index, stock);
              getTotalToPayNotifier.updateTotal(listShopping);
            },
            icon: const Icon(
              Icons.add,
              size: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageProduct(String url) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.all(5),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
