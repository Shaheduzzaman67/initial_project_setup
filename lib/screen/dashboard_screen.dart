
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_setup/app/assets.dart';
import 'package:project_setup/app/colors.dart';
import '../Controller/Dashboard/dashboard_controller.dart';




class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController homeController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: homeController.selectedIndex.toInt() == 1
              ? AppColors.backgroundWhite
              : Colors.white,
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: homeController.selectedIndex.toInt(),
              onTap: homeController.onItemTapped,
              selectedItemColor: const Color(0XFFDF5356),
              unselectedItemColor: Colors.grey.shade400,
              type: BottomNavigationBarType.fixed,
              iconSize: 35,
              elevation: 3,
              items: [
                BottomNavigationBarItem(
                  icon: homeController.selectedIndex.toInt() == 0
                      ? SvgPicture.asset(
                          Assets.homeIcon,
                          height: 35,
                          color: const Color(0XFFDF5356),
                        )
                      : SvgPicture.asset(
                          Assets.homeIcon,
                          height: 35,
                          color: Colors.grey.shade400,
                        ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: homeController.selectedIndex.toInt() == 1
                      ? SvgPicture.asset(
                          Assets.searchIcon,
                          height: 35,
                          color: const Color(0XFFDF5356),
                        )
                      : SvgPicture.asset(
                          Assets.searchIcon,
                          height: 35,
                          color: Colors.grey.shade400,
                        ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: homeController.selectedIndex.toInt() == 2
                      ? SvgPicture.asset(
                          Assets.cartIcon,
                          height: 35,
                          color: const Color(0XFFDF5356),
                        )
                      : SvgPicture.asset(
                          Assets.cartIcon,
                          height: 35,
                          color: Colors.grey.shade400,
                        ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: homeController.selectedIndex.toInt() == 3
                      ? SvgPicture.asset(
                          Assets.userIcon,
                          height: 35,
                          color: const Color(0XFFDF5356),
                        )
                      : SvgPicture.asset(
                          Assets.userIcon,
                          height: 35,
                          color: Colors.grey.shade400,
                        ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
          body: Obx(() => _body(homeController.selectedIndex.toInt())),
        ));
  }

  _body(int index) {
    switch (index) {
      case 0:
        return const Text('data2');
      case 1:
        return const Text('data2');
      case 2:
        return const Text('data3');
      case 3:
        return const Text('data4');
      default:
        return const Offstage();
    }
  }
}
