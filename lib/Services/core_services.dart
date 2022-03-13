
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setup/Model/header_model.dart';
import 'package:project_setup/Store/session.dart';
import 'package:project_setup/Strings/network_label.dart';



class CoreService extends GetConnect {

  Future<dynamic> getWithoutAuth({required String url}) async {
    debugPrint("Url : $url");
    var data = await get(url);
    debugPrint("Body : ${data.body}");
    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.isServerError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });

      return null;
    } else if (data.status.connectionError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
            NetworkLabel.hasErrorTitle, NetworkLabel.connectionErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.isNotFound) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.isNotFoundMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else {
      return data.body;
    }
  }

  Future<dynamic> getWithAuth({required String url}) async {
    var token = await Session.shared.getSecret();
    HeaderModel headerModel =
        HeaderModel(authorization: "Bearer $token");
    debugPrint("Header : ${"Bearer $token"}");
    debugPrint("Url : $url");
    var data = await get(url, headers: headerModel.toHeader());
    debugPrint("Body : ${data.body}");
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

  Future<dynamic> postWithoutAuth(
      {Map<String, dynamic>? body, required String url}) async {
    debugPrint("Url : $url");
    debugPrint("Body : $body");
    var data = await post(url, body);
    // var data = await post(url, FormData(body!)); //This is used for passing the body as form data

    debugPrint("response : ${data.body}");
    debugPrint("response code : ${data.status.code}");

    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.error,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.isServerError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });

      return null;
    } else if (data.status.connectionError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
            NetworkLabel.hasErrorTitle, NetworkLabel.connectionErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.isNotFound) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.isNotFoundMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else {
      return data.body;
    }
  }

  Future<dynamic> postWithAuth(
      {Map<String, dynamic>? body, required String url}) async {
    var token = await Session.shared.getSecret();
    HeaderModel headerModel =
        HeaderModel(authorization: "Bearer $token");
    debugPrint("Header : ${"Bearer $token"}");
    debugPrint("Url : $url");
    debugPrint("Body : $body");
    var data =
        await post(url, FormData(body!), headers: headerModel.toHeader());

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

  Future<dynamic> postFileWithoutAuth(
      {required List<int> img,
      required String filename,
      required String url,
      required String key}) async {
    final image = MultipartFile(img, filename: filename);
    var data = await post(url, FormData({key: image}));
    if (data.hasError) {
      Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage);
      return null;
    } else if (data.status.hasError) {
      Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage);
      return null;
    } else if (data.status.isServerError) {
      Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage);
      return null;
    } else if (data.status.connectionError) {
      Get.snackbar(
          NetworkLabel.hasErrorTitle, NetworkLabel.connectionErrorMessage);
      return null;
    } else if (data.status.isNotFound) {
      Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.isNotFoundMessage);
      return null;
    } else {
      return data.body;
    }
  }

  Future<dynamic> postFileWithAuth({
    required List<int> upload,
    required String filename,
    required String url,
    required String key,
  }) async {
    var token = await Session.shared.getSecret();
    HeaderModel headerModel =
        HeaderModel(authorization: "Bearer $token");
    final image = MultipartFile(
      upload,
      filename: filename,
    );
    debugPrint(url);
    // debugPrint(image.length.toString());
    debugPrint(filename);

    var data = await post(
        url,
        FormData({
          'file': image,
        }),
        headers: headerModel.toHeader());
    debugPrint(data.statusCode.toString());

    debugPrint(data.body.toString());

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

  Future<dynamic> putFileWithAuth({
    required List<int> upload,
    required String filename,
    required String url,
    required String key,
  }) async {
    var token = await Session.shared.getSecret();
    HeaderModel headerModel =
    HeaderModel(authorization: "Bearer $token");
    final image = MultipartFile(
      upload,
      filename: filename,
    );
    debugPrint(url);
    // debugPrint(image.length.toString());
    debugPrint(filename);

    var data = await put(
        url,
        FormData({
          'upload': image,
        }),
        headers: headerModel.toHeader());
    debugPrint(data.statusCode.toString());

    debugPrint(data.body.toString());

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

  Future<dynamic> putWithoutAuth(
      {Map<String, dynamic>? body, required String url}) async {
    debugPrint("Url : $url");
    debugPrint("Body : $body");
    var data = await put(url, body);
    // var data = await post(url, FormData(body!)); //This is used for passing the body as form data
    debugPrint("response body: ${data.body}");
    debugPrint("response http statusCode: ${data.statusCode}");
    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.isServerError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.hasErrorMessage,
            backgroundColor: Colors.white);
      });

      return null;
    } else if (data.status.connectionError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
            NetworkLabel.hasErrorTitle, NetworkLabel.connectionErrorMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else if (data.status.isNotFound) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(NetworkLabel.hasErrorTitle, NetworkLabel.isNotFoundMessage,
            backgroundColor: Colors.white);
      });
      return null;
    } else {
      return data.body;
    }
  }

  Future<dynamic> putWithAuth(
      {Map<String, dynamic>? body, required String url}) async {
    var token = await Session.shared.getSecret();
    HeaderModel headerModel =
        HeaderModel(authorization: "Bearer $token");
    debugPrint("Header : ${"Bearer $token"}");
    debugPrint("Url : $url");
    debugPrint("Body : $body");
    var data = await put(url, body!, headers: headerModel.toHeader());

    debugPrint(data.statusCode.toString());
    debugPrint(data.body.toString());

    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
          NetworkLabel.hasErrorTitle,
          data.body["errMessage"],
          backgroundColor: Colors.white,
        );
      });
      return null;
    } else if (data.statusCode == 400) {
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

  Future<dynamic> patchWithAuthImageDelete(
      {Map<String, dynamic>? body, required String url}) async {
    var token = await Session.shared.getSecret();
    HeaderModel headerModel =
        HeaderModel(authorization: "Bearer $token");
    debugPrint("Header : ${"Bearer $token"}");
    debugPrint("Url : $url");
    debugPrint("Body : $body");
    var data = await patch(url, null, headers: headerModel.toHeader());

    debugPrint(data.statusCode.toString());
    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
          NetworkLabel.hasErrorTitle,
          data.body["errMessage"],
          backgroundColor: Colors.white,
        );
      });
      return null;
    } else if (data.statusCode == 400) {
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

  Future<dynamic> patchWithAuth(
      {Map<String, dynamic>? body, required String url}) async {
    var token = await Session.shared.getSecret();
    HeaderModel headerModel =
    HeaderModel(authorization: "Bearer $token");
    debugPrint("Header : ${"Bearer $token"}");
    debugPrint("Url : $url");
    debugPrint("Body : $body");
    var data = await patch(url, body!, headers: headerModel.toHeader());

    debugPrint(data.statusCode.toString());
    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
          NetworkLabel.hasErrorTitle,
          data.body["errMessage"],
          backgroundColor: Colors.white,
        );
      });
      return null;
    } else if (data.statusCode == 400) {
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
