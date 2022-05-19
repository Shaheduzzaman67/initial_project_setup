import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Router/route_constants.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    debugPrint(selectedIndex.value.toString());
  }

  toDashboard(){
    Get.offNamed(dashBoard);
  }
}
