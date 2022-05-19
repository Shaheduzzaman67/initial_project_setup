

import 'package:get_storage/get_storage.dart';
import 'package:project_setup/strings/config_string.dart';
import 'package:project_setup/strings/storage_string.dart';




class Session {
  final box = GetStorage();
  static final Session _singleton = Session._internal();
  static Session get shared => _singleton;
  factory Session() {
    return _singleton;
  }
  Session._internal();


  convertToInt({dynamic data}) {
    if (data is String) {
      return int.tryParse(data) ?? 0;
    }
    if (data is int) {
      return data;
    }
  }


  getSecret() async {
    var tk = await box.read(StorageString.secrate) ?? "";
    print("🍎 secrate from box! $tk");
    ConfigString.secrate = tk;
    return tk;
  }

  saveSecret(String newSecrate) async {
    ConfigString.secrate = newSecrate;
    box.write(StorageString.secrate, newSecrate);
    print("🍎saved secrate to box! $newSecrate");
  }
  clearSecret() async {
    box.remove(StorageString.secrate);
    print("🍎delete secrate");
  }

}
