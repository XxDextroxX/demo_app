import 'package:demo_app/api/api.dart';
import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class CardShoppingPage extends ConsumerStatefulWidget {
  const CardShoppingPage({super.key});

  @override
  CardShoppingPageState createState() => CardShoppingPageState();
}

class CardShoppingPageState extends ConsumerState<CardShoppingPage> {
  late LoadingButtonController _btnController;
  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listShopping = ref.watch(listShoppingProvider);
    final listShoppingNotifier = ref.watch(listShoppingProvider.notifier);
    final getTotalToPay = ref.watch(totalToPayProvider);
    final getTotalToPayNotifier = ref.watch(totalToPayProvider.notifier);
    final updateStateShoppingNotifier =
        ref.watch(updateStateShoppingProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
        actions: [
          IconButton(
            onPressed: () {
              if (listShopping.isNotEmpty) {
                CustomDialogs.generalDialog(
                  context: context,
                  title: 'Limpiar carrito',
                  content: '¿Desea limpiar el carrito?',
                  onPressed: () async {
                    listShoppingNotifier.reset();
                    Navigator.pop(context);
                  },
                );
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: listShopping.isEmpty
          ? const WidgetEmpty()
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    itemCount: listShopping.length,
                    itemBuilder: (context, index) {
                      final product = listShopping[index];
                      return ListProducts(
                        model: product,
                        index: index,
                      );
                    },
                  ),
                ),
                _totalShopping(
                    listShopping, getTotalToPayNotifier, getTotalToPay),
                CustomLoadingButton(
                    primaryColor: Theme.of(context).primaryColorDark,
                    text: 'COMPRAR',
                    icon: Icons.shopping_cart_outlined,
                    btnController: _btnController,
                    onPressed: () async {
                      final api = ApiProducts();
                      final response =
                          await api.checkAndBuyProducts(context, listShopping);
                      if (response) {
                        final apiShopping = ApiShopping();
                        await Future.delayed(const Duration(seconds: 1));
                        await apiShopping.addShopping(listShopping);
                        listShoppingNotifier.reset();
                        CustomSnackbar.showSnackBar(
                          'Compra realizada',
                          // ignore: use_build_context_synchronously
                          context,
                        );
                        updateStateShoppingNotifier.update();
                        // ignore: use_build_context_synchronously
                        context.push(PathRouter.shopping);
                      }
                      _btnController.success();
                      _btnController.reset();
                    })
              ],
            ),
    );
  }

  Widget _totalShopping(List<ProductModel> listShopping,
      TotalToPay getTotalToPayNotifier, double getTotalToPay) {
    double totalAux = (listShopping.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.stock! * element.price!)));
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.attach_money_sharp,
            color: Theme.of(context).primaryColor,
          )),
      title: const Text(
        'Total: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        '${GeneralUtils.getAmoutFormat(getTotalToPay == 0 ? totalAux : getTotalToPay)}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
