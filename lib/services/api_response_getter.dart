
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setup/strings/network_label.dart';


class RemoteServices extends GetConnect {
  Future<dynamic> getStatesList(
      {Map<String, dynamic>? body, required String url}) async {
    debugPrint("Url : $url");
    debugPrint("Body : $body");
    var data = await post(url, FormData(body!));

    debugPrint(data.body);
    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage);
      });
      return null;
    } else if (data.status.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage);
      });
      return null;
    } else if (data.status.isServerError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage);
      });

      return null;
    } else if (data.status.connectionError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
            NetworkLabel.hasErrorTitle, NetworkLabel.connectionErrorMessage);
      });
      return null;
    } else if (data.status.isNotFound) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.isNotFoundMessage);
      });
      return null;
    } else {
      return data.body;
    }
  }
}
