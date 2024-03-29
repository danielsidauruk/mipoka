import 'dart:io';
import 'package:universal_html/html.dart' as html;
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

Future<void> downloadFileWithDio({
  required String url,
  required String fileName
}) async {
  try {
    if (kIsWeb){
      html.window.open(url, "_blank");
    } else if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();

      if (statuses[Permission.storage]!.isGranted) {
        var dir = await DownloadsPathProvider.downloadsDirectory;
        if (dir != null) {
          String fileName = Uri.parse(url).pathSegments.last;
          String savePath = "${dir.path}/$fileName";
          print(savePath);

          await Dio().download(
            url,
            savePath,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                return mipokaCustomToast("${(received / total * 100).toStringAsFixed(0)}%");
              }
            },
          );
          mipokaCustomToast("File is saved to the download folder.");
        }
      } else {
        mipokaCustomToast("No permission to read and write.");
      }
    }
  } catch (e) {
    print(e);
    mipokaCustomToast("failed to download file.");
  }
}