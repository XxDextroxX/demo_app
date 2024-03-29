import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/validator/validator.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends ConsumerState<EditProfile> {
  bool _obscureText = true;
  late LoadingButtonController _btnController;
  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = UserModel.instance();
    final updatePassowrd = ref.watch(updatePasswordProvider);
    final updatePassowrdInstance = ref.watch(updatePasswordProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil de usuario')),
      drawer: const DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
            Text(
              'Información de Usuario',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
            _userData(userModel),
            const SizedBox(height: 10),
            Text(
              'Actualizar contraseña',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 10),
            CustomInputs(
              maxLines: 1,
              errorText: updatePassowrd.errorMessage,
              obscureText: _obscureText,
              hintText: 'Contraseña',
              prefixIcon: const Icon(
                Icons.lock_outline,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  )),
              onChanged: updatePassowrdInstance.setPassword,
            ),
            const SizedBox(height: 20),
            Center(
                child: _buttonUpdate(updatePassowrdInstance, updatePassowrd)),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }

  Widget _buttonUpdate(
      UpdatePassword updatePassowrdInstance, Password updatePassowrd) {
    return CustomLoadingButton(
        primaryColor: Theme.of(context).primaryColorDark,
        color: Colors.white,
        text: 'Actualizar contraseña',
        icon: Icons.save,
        btnController: _btnController,
        onPressed: () async {
          await updatePassowrdInstance.updatePassword(context);
          await GeneralUtils.setPassword(updatePassowrd.value);
          _btnController.success();
          _btnController.reset();
        });
  }

  Widget _userData(UserModel user) {
    return Column(
      children: [
        _text('Nombre: ', user.name ?? ''),
        _text('Apellido: ', user.lastName ?? ''),
        _text('Email: ', user.email ?? ''),
        if (user.role != null)
          _text(
            'Rol: ',
            user.role == 'seller' ? 'Vendedor' : user.role ?? '',
          ),
      ],
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
