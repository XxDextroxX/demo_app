import 'package:demo_app/config/config.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: PathRouter.splash, routes: [
  GoRoute(
    path: PathRouter.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: PathRouter.homeAdmin,
    builder: (context, state) => const HomePageAdmin(),
  ),
  GoRoute(
    path: PathRouter.homeSeller,
    builder: (context, state) => const HomePageSeller(),
  ),
  GoRoute(
    path: PathRouter.homeClient,
    builder: (context, state) => const HomePageClient(),
  ),
  GoRoute(
    path: PathRouter.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: PathRouter.editProfile,
    builder: (context, state) => const EditProfile(),
  ),
  GoRoute(
      path: PathRouter.adminSellers,
      builder: (context, state) => const AdminSellers()),
  GoRoute(
    path: PathRouter.viewProductsAdmin,
    builder: (context, state) => const ViewProductsAdmin(),
  ),
  GoRoute(
    path: PathRouter.createProduct,
    builder: (context, state) => const CreateProducts(),
  ),
  GoRoute(
    path: PathRouter.shopping,
    builder: (context, state) => const ShoppingPage(),
  ),
  GoRoute(
    path: PathRouter.createSeller,
    builder: (context, state) => const CreateSeller(),
  ),
  GoRoute(
    path: PathRouter.cardShopping,
    builder: (context, state) => const CardShoppingPage(),
  ),
]);
