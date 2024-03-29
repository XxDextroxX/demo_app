import 'package:demo_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopProducts extends ConsumerWidget {
  const ShopProducts({super.key, required this.cuantity});
  final int cuantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addShopping = ref.watch(addShoppingProvider);
    final addShoppingNotifier = ref.watch(addShoppingProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (addShopping < cuantity) {
              addShoppingNotifier.increment();
            }
          },
          icon: const Icon(Icons.add),
        ),
        Text(addShopping.toString()),
        IconButton(
          onPressed: () {
            if (addShopping > 0) {
              addShoppingNotifier.decrement();
            }
          },
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
