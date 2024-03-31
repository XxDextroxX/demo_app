import 'dart:io';

import 'package:demo_app/api/api.dart';
import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class CreateProducts extends ConsumerStatefulWidget {
  const CreateProducts({super.key});

  @override
  CreateProductsState createState() => CreateProductsState();
}

class CreateProductsState extends ConsumerState<CreateProducts> {
  ProductModel product = ProductModel();
  late LoadingButtonController _btnController;

  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listImagesInstance = ref.watch(loadImagesProvider.notifier);
    final listImages = ref.watch(loadImagesProvider);
    final updateStateNotifier = ref.watch(updateStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Crear producto')),
      drawer: const DrawerWidget(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInputs(
                  hintText: 'Nombre del producto',
                  prefixIcon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                  onChanged: (value) {
                    product.name = value;
                  }),
              const SizedBox(height: 20),
              CustomInputs(
                  keyboardType: TextInputType.number,
                  hintText: 'Cantidad',
                  prefixIcon: const Icon(
                    Icons.numbers_outlined,
                  ),
                  onChanged: (value) {
                    product.stock = int.tryParse(value);
                  }),
              const SizedBox(height: 20),
              CustomInputs(
                  keyboardType: TextInputType.number,
                  hintText: 'Precio',
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined,
                  ),
                  onChanged: (value) {
                    product.price = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        if (listImages != null && listImages.length >= 10) {
                          CustomSnackbar.showSnackBar(
                              'No se pueden agregar mas de 10 imagenes',
                              context,
                              isSuccess: false);
                          return;
                        }
                        const imageSource = ImageSource.camera;
                        final image =
                            await ImageUpload.selectImage(imageSource, context);
                        if (image != null) {
                          listImagesInstance.addImage(image);
                        }
                      },
                      icon: const Icon(Icons.camera_alt)),
                  IconButton(
                      onPressed: () async {
                        if (listImages != null && listImages.length >= 10) {
                          CustomSnackbar.showSnackBar(
                              'No se pueden agregar mas de 10 imagenes',
                              context,
                              isSuccess: false);
                          return;
                        }
                        final images =
                            await ImageUploadMultiple.selectImages(context);
                        if (images != null) {
                          listImagesInstance.addImages(images);
                        }
                      },
                      icon: const Icon(Icons.photo)),
                ],
              ),
              const SizedBox(height: 10),
              ViewImages(
                imageFiles: listImages,
              ),
              const SizedBox(height: 10),
              Center(child: _buttonCreate(listImages, updateStateNotifier)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonCreate(
      List<File>? listImages, UpdateState updateStateNotifier) {
    return CustomLoadingButton(
        primaryColor: Theme.of(context).primaryColorDark,
        color: Colors.white,
        text: 'Crear producto',
        icon: Icons.add,
        btnController: _btnController,
        onPressed: () async {
          if (!validate()) {
            _btnController.success();
            _btnController.reset();
            return;
          }
          final api = ApiProducts();
          List<String> images = [];
          if (listImages == null || listImages.isEmpty) {
            // ignore: use_build_context_synchronously
            CustomSnackbar.showSnackBar(
                'Debes subir al menos una imagen', context,
                isSuccess: false);
            _btnController.success();
            _btnController.reset();
            return;
          }
          images = await api.uploadImages(listImages);
          product.images = images;
          await api.addProduct(
            product,
            images,
          );
          final pushNotification = PushNotifications();
          pushNotification.sendNotificationClients(product.name ?? '');
          final listImagesInstance = ref.watch(loadImagesProvider.notifier);
          listImagesInstance.clear();
          _btnController.success();
          _btnController.reset();
          updateStateNotifier.update();
          product = ProductModel();
          // ignore: use_build_context_synchronously
          CustomSnackbar.showSnackBar('Producto creado', context);
          // ignore: use_build_context_synchronously
          context.push(PathRouter.homeSeller);
        });
  }

  bool validate() {
    if (product.name == null) {
      CustomSnackbar.showSnackBar('El nombre es obligatorio', context,
          isSuccess: false);
      return false;
    } else if (product.stock == null) {
      CustomSnackbar.showSnackBar('Ingrese la cantidad', context,
          isSuccess: false);
      return false;
    } else if (product.price == null) {
      CustomSnackbar.showSnackBar('Ingrese el precio', context,
          isSuccess: false);
      return false;
    } else if (product.stock! < 0 || product.price! < 0) {
      CustomSnackbar.showSnackBar(
          'Los valores no pueden ser negativos', context,
          isSuccess: false);
      return false;
    } else if (product.stock! < 1 || product.price! < 1) {
      CustomSnackbar.showSnackBar('Los valores no pueden ser 0', context,
          isSuccess: false);
      return false;
    } else {
      return true;
    }
  }
}
