import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';

void getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Device: Android');
    print('Model: ${androidInfo.model}');
    print('Android Version: ${androidInfo.version.release}');
    // Tambahkan logika khusus untuk Android di sini
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Device: iOS');
    print('Model: ${iosInfo.model}');
    print('iOS Version: ${iosInfo.systemVersion}');
    // Tambahkan logika khusus untuk iOS di sini
  } else if (kIsWeb) {
    print('Device: Web');
    // Tambahkan logika khusus untuk web di sini
  } else {
    print('Device: Unknown');
  }
}
