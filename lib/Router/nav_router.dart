
import 'package:get/route_manager.dart';
import 'package:project_setup/Router/route_constants.dart';
import 'package:project_setup/Screen/splash_screen.dart';




class NavRouter {
  static final generateRoute = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
  ];
}
