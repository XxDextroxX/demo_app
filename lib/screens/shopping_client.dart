import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingPage extends ConsumerWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getShopping = ref.watch(getShoppingProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Compras realizadas'),
        ),
        drawer: const DrawerWidget(),
        body: getShopping.when(
          data: (data) {
            if (data.isEmpty) {
              return const WidgetEmpty();
            }
            //order by createdAt
            data = data.toList()
              ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsShopping(model: data[index])));
                  },
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Fecha de compra:'),
                  subtitle:
                      Text(data[index].createdAt.toString().substring(0, 10)),
                  trailing: Text(
                    GeneralUtils.timeAgo(data[index].createdAt ?? ''),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const WidgetLoading(),
        ));
  }
}
