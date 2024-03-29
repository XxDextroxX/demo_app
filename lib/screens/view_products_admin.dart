import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewProductsAdmin extends ConsumerStatefulWidget {
  const ViewProductsAdmin({super.key});

  @override
  ViewProductsAdminState createState() => ViewProductsAdminState();
}

class ViewProductsAdminState extends ConsumerState<ViewProductsAdmin> {
  bool isAscendingDate = true;
  bool isAscendingPrice = true;
  bool isAscendingName = true;
  bool isAscendingStock = true;
  bool isAscendingSold = true;
  List<ProductModel> allData = [];
  @override
  Widget build(BuildContext context) {
    final updateState = ref.watch(updateStateProvider);
    final updateStateNotifier = ref.watch(updateStateProvider.notifier);
    final getAllProducts = ref.watch(
      getAllProductsProvider(updateStateAux: updateState),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ver todos los productos'),
          actions: [
            IconButton(
              onPressed: () {
                updateStateNotifier.update();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        drawer: const DrawerWidget(),
        body: getAllProducts.when(
          data: (data) {
            if (data.isEmpty) {
              return const Center(
                child: WidgetEmpty(),
              );
            }

            allData = data;
            return SizedBox(
                height: size.height * 1,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columnSpacing: 50,
                        headingRowHeight: 50,
                        headingRowColor: MaterialStateProperty.resolveWith(
                            (states) => Theme.of(context).primaryColor),
                        columns: [
                          const DataColumn(
                              label: Text(
                            'N°',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          DataColumn(
                              label: TextButton(
                                  onPressed: () {
                                    if (isAscendingDate) {
                                      allData = allData
                                        ..sort((a, b) => b.createdAt!
                                            .compareTo(a.createdAt!));
                                      isAscendingDate = false;
                                    } else {
                                      allData = allData
                                        ..sort((a, b) => a.createdAt!
                                            .compareTo(b.createdAt!));
                                      isAscendingDate = true;
                                    }
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Fecha',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))),
                          DataColumn(
                              label: TextButton(
                                  onPressed: () {
                                    if (isAscendingName) {
                                      allData = allData
                                        ..sort((a, b) =>
                                            b.name!.compareTo(a.name!));
                                      isAscendingName = false;
                                    } else {
                                      allData = allData
                                        ..sort((a, b) =>
                                            a.name!.compareTo(b.name!));
                                      isAscendingName = true;
                                    }
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Nombre',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))),
                          DataColumn(
                              label: TextButton(
                            onPressed: () {
                              if (isAscendingStock) {
                                allData = allData
                                  ..sort(
                                      (a, b) => b.stock!.compareTo(a.stock!));
                                isAscendingStock = false;
                              } else {
                                allData = allData
                                  ..sort(
                                      (a, b) => a.stock!.compareTo(b.stock!));
                                isAscendingStock = true;
                              }
                              setState(() {});
                            },
                            child: const Text(
                              'Cantidad',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                          DataColumn(
                              label: TextButton(
                                  onPressed: () {
                                    if (isAscendingPrice) {
                                      allData = allData
                                        ..sort((a, b) =>
                                            b.price!.compareTo(a.price!));
                                      isAscendingPrice = false;
                                    } else {
                                      allData = allData
                                        ..sort((a, b) =>
                                            a.price!.compareTo(b.price!));
                                      isAscendingPrice = true;
                                    }
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Precio',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))),
                          const DataColumn(
                              label: Text(
                            'Vendido',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          const DataColumn(
                              label: Text(
                            'Ver',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ],
                        rows: allData
                            .map((e) => DataRow(cells: [
                                  DataCell(Text('${data.indexOf(e) + 1}')),
                                  DataCell(Text(
                                      e.createdAt.toString().substring(0, 10))),
                                  DataCell(Text(e.name ?? '')),
                                  DataCell(Text(e.stock.toString())),
                                  DataCell(_column4(e.price.toString())),
                                  DataCell(_column5(e.isSold)),
                                  DataCell(_column7(e)),
                                ]))
                            .toList()),
                  ),
                ));
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const WidgetLoading();
          },
        ));
  }

  Widget _column4(String price) {
    double priceDouble = double.tryParse(price) ?? 0.0;
    Color color = Colors.green;
    if (priceDouble >= 0.1 && priceDouble <= 10) {
      color = Colors.green;
    } else if (priceDouble > 10 && priceDouble <= 20) {
      color = Colors.yellow;
    } else {
      color = Colors.red;
    }

    return Text(
      '\$ ${priceDouble.toStringAsFixed(2)}',
      style: TextStyle(color: color),
    );
  }

  Widget _column5(bool isSold) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 50,
      decoration: BoxDecoration(
        color: !isSold ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(isSold ? 'Si' : 'No'),
    );
  }

  Widget _column7(ProductModel model) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsProduct(
                product: model,
              ),
            ),
          );
        },
        icon:
            Icon(Icons.remove_red_eye, color: Theme.of(context).primaryColor));
  }
}
