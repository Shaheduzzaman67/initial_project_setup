import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setup/AppManager/assets.dart';
import 'package:project_setup/AppManager/screen_constants.dart';
import 'package:project_setup/Controller/Dashboard/dashboard_controller.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
 DashboardController dashboardController = Get.put(DashboardController());
  AnimationController? animationController;
  Animation<double>? animation;
  var _visible = true;

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, dashboardController.toDashboard());
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    animation!.addListener(() => setState(() {}));
    animationController!.forward();
    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConstant.setScreenAwareConstant(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
              Assets.homeIcon,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
