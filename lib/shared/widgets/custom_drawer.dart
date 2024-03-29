import 'package:demo_app/api/api.dart';
import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/providers/providers.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  DrawerWidgetState createState() => DrawerWidgetState();
}

class DrawerWidgetState extends ConsumerState<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(currentIndexDrawerProvider);
    final intanceIndex = ref.watch(currentIndexDrawerProvider.notifier);
    final userModel = UserModel.instance();
    final user = userModel.getData();
    final role = user.role ?? 'root';
    return NavigationDrawer(
        elevation: 1,
        selectedIndex: index,
        onDestinationSelected: (value) {
          intanceIndex.changeIndex(value);
          if (role == 'admin') {
            _getRouteAdmin(value);
          } else if (role == 'seller') {
            _getRouteSeller(value);
          } else {
            _getRouteClient(value);
          }
        },
        children: [
          HeaderDrawer(
            userModel: user,
          ),
          ..._itemsToDrawer(user.role ?? 'admin'),
        ]);
  }

  List<Widget> _itemsToDrawer(String role) {
    switch (role) {
      case 'admin':
        return _itemsToAdmin();
      case 'seller':
        return _itemsToSeller();
      case 'client':
        return _itemsToClient();
      default:
        return _itemsToAdmin();
    }
  }

  void _getRouteAdmin(
    int index,
  ) {
    if (index != 3) {
      Navigator.of(context).pop();
    }
    switch (index) {
      case 0:
        context.push(PathRouter.homeAdmin);
        break;
      case 1:
        context.push(PathRouter.viewProductsAdmin);
        break;
      case 2:
        context.push(PathRouter.editProfile);
        break;
      case 3:
        CustomDialogs.generalDialog(
          context: context,
          title: 'Cerrar Sesión',
          content: '¿Desea cerrar sesión?',
          onPressed: () async {
            final auth = LoginAuth();
            await GeneralUtils.removeUid();
            await GeneralUtils.removePassword();
            await auth.signOut();
            // ignore: use_build_context_synchronously
            context.go(PathRouter.login);
          },
        );
        break;
      default:
    }
  }

  void _getRouteSeller(
    int index,
  ) {
    if (index != 3) {
      Navigator.of(context).pop();
    }
    switch (index) {
      case 0:
        context.push(PathRouter.homeSeller);
        break;
      case 1:
        context.push(PathRouter.createProduct);
        break;
      case 2:
        context.push(PathRouter.editProfile);
        break;
      case 3:
        CustomDialogs.generalDialog(
          context: context,
          title: 'Cerrar Sesión',
          content: '¿Desea cerrar sesión?',
          onPressed: () async {
            final auth = LoginAuth();
            await GeneralUtils.removeUid();
            await GeneralUtils.removePassword();
            await auth.signOut();
            // ignore: use_build_context_synchronously
            context.go(PathRouter.login);
          },
        );
        break;
      default:
    }
  }

  void _getRouteClient(
    int index,
  ) {
    if (index != 3) {
      Navigator.of(context).pop();
    }
    switch (index) {
      case 0:
        context.push(PathRouter.homeClient);
        break;
      case 1:
        context.push(PathRouter.shopping);
        break;
      case 2:
        context.push(PathRouter.editProfile);
        break;
      case 3:
        CustomDialogs.generalDialog(
          context: context,
          title: 'Cerrar Sesión',
          content: '¿Desea cerrar sesión?',
          onPressed: () async {
            final auth = LoginAuth();
            await GeneralUtils.removeUid();
            await GeneralUtils.removePassword();
            await auth.signOut();
            // ignore: use_build_context_synchronously
            context.go(PathRouter.login);
          },
        );
        break;
      default:
    }
  }

  List<Widget> _itemsToAdmin() {
    return [
      const NavigationDrawerDestination(
        label: Text('Vendedores'),
        icon: Icon(Icons.people),
      ),
      const NavigationDrawerDestination(
        label: Text('Productos'),
        icon: Icon(Icons.shopping_bag),
      ),
      const NavigationDrawerDestination(
        label: Text('Perfil'),
        icon: Icon(Icons.person),
      ),
      const NavigationDrawerDestination(
        label: Text('Cerrar Sesión'),
        icon: Icon(Icons.exit_to_app),
      ),
    ];
  }

  List<Widget> _itemsToSeller() {
    return [
      const NavigationDrawerDestination(
        label: Text('Productos'),
        icon: Icon(Icons.shopping_bag),
      ),
      const NavigationDrawerDestination(
        label: Text('Crear productos'),
        icon: Icon(Icons.add),
      ),
      const NavigationDrawerDestination(
        label: Text('Perfil'),
        icon: Icon(Icons.person),
      ),
      const NavigationDrawerDestination(
        label: Text('Cerrar Sesión'),
        icon: Icon(Icons.exit_to_app),
      ),
    ];
  }

  List<Widget> _itemsToClient() {
    return [
      const NavigationDrawerDestination(
        label: Text('Productos'),
        icon: Icon(Icons.shopping_bag),
      ),
      const NavigationDrawerDestination(
        label: Text('Compras'),
        icon: Icon(Icons.shopping_cart),
      ),
      const NavigationDrawerDestination(
        label: Text('Perfil'),
        icon: Icon(Icons.person),
      ),
      const NavigationDrawerDestination(
        label: Text('Cerrar Sesión'),
        icon: Icon(Icons.exit_to_app),
      ),
    ];
  }
}
