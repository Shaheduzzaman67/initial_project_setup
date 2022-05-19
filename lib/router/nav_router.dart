
import 'package:get/route_manager.dart';
import 'package:project_setup/router/route_constants.dart';
import 'package:project_setup/screen/splash_screen.dart';




class NavRouter {
  static final generateRoute = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
  ];
}
