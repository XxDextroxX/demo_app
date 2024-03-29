import 'package:demo_app/config/config.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class CreateSeller extends ConsumerStatefulWidget {
  const CreateSeller({super.key});

  @override
  CreateSellerState createState() => CreateSellerState();
}

class CreateSellerState extends ConsumerState<CreateSeller> {
  late LoadingButtonController _btnController;

  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final createSeller = ref.watch(createSellerProvider);
    final createSellerNotifier = ref.watch(createSellerProvider.notifier);
    return Scaffold(
        appBar: AppBar(title: const Text('Crear vendedor')),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomInputs(
                  errorText: createSeller.email.errorMessage,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Correo electronico',
                  textCapitalization: false,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  suffixIcon: null,
                  onChanged: createSellerNotifier.setEmail,
                ),
                const SizedBox(height: 20),
                CustomInputs(
                  errorText: createSeller.name.errorMessage,
                  hintText: 'Nombre',
                  textCapitalization: true,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                  ),
                  suffixIcon: null,
                  onChanged: createSellerNotifier.setName,
                ),
                const SizedBox(height: 20),
                CustomInputs(
                  errorText: createSeller.lastName.errorMessage,
                  hintText: 'Apellidos',
                  textCapitalization: true,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                  ),
                  suffixIcon: null,
                  onChanged: createSellerNotifier.setLastName,
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomLoadingButton(
                      primaryColor: Theme.of(context).primaryColorDark,
                      text: 'Registrar',
                      icon: Icons.save,
                      btnController: _btnController,
                      onPressed: () async {
                        final response =
                            await createSellerNotifier.registerUser(context);
                        if (response) {
                          createSellerNotifier.reset();
                          // ignore: use_build_context_synchronously
                          context.push(PathRouter.homeAdmin);
                        }
                        _btnController.success();
                        _btnController.reset();
                      }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
