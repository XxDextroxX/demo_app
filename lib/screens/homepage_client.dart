import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePageClient extends ConsumerWidget {
  const HomePageClient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listShopping = ref.watch(listShoppingProvider);
    final getProductsRealTime = ref.watch(getProductsRealTimeProvider());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Productos'),
          actions: [
            _cardShopping(listShopping, context),
          ],
        ),
        drawer: const DrawerWidget(),
        body: getProductsRealTime.when(
          data: (data) {
            if (data.isEmpty) {
              return const WidgetEmpty();
            }
            return Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 280),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _viewProduct(context, model: data[index]);
                    },
                    child: CardProduct(
                      model: data[index],
                    ),
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const WidgetLoading(),
        ));
  }

  _viewProduct(BuildContext context, {ProductModel? model}) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 1,
            child: DetailsProduct(
              product: model!,
            ),
          );
        });
  }

  Widget _cardShopping(List<ProductModel> listShopping, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          IconButton(
              onPressed: () async {
                context.push(PathRouter.cardShopping);
              },
              icon: const Icon(Icons.shopping_cart)),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: listShopping.isEmpty ? Colors.red : Colors.green,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                '${listShopping.length}',
                style: const TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
