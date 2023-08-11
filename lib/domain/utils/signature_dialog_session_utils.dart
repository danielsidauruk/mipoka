import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/data/models/usulan_kegiatan_model.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/pages/pengguna/pengguna_pengajuan_usulan_kegiatan_3_page.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../../../domain/utils/mobile_image_converter.dart'
if (dart.library.html) '../../../../domain/utils/web_image_converter.dart';

class SignatureDialogUtils {
  static void showPopup(
      BuildContext context,
      Session session,
      ) async {

    final GlobalKey<SfSignaturePadState> key = GlobalKey();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(12.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Tanda Tangan Kemahasiswaan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.clear,
                  size: 24.0,
                ),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.all(16.0),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width < 306
                  ? MediaQuery.of(context).size.width
                  : 306,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width < 300
                        ? MediaQuery.of(context).size.width
                        : 300,
                    height: 170,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[350]!),
                    ),
                    child: SfSignaturePad(
                      backgroundColor: Colors.white,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 1.0,
                      maximumStrokeWidth: 4.0,
                      key: key,
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          actionsPadding: const EdgeInsets.all(8.0),
          buttonPadding: EdgeInsets.zero,
          actions: [
            TextButton(
              onPressed: () => key.currentState!.clear(),
              child: const Text(
                'Clear',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            TextButton(
              onPressed: () async {
                await _handleSaveButtonPressed(context, session, key);
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static Future<void> _handleSaveButtonPressed(
      BuildContext context,
      Session session,
      GlobalKey<SfSignaturePadState> key,
      ) async {

    Uint8List? data;
    String? tandaTangan;
    // String? docxUrl;
    int uniqueId = UniqueIdGenerator.generateUniqueId();

    if (kIsWeb) {
      final RenderSignaturePad renderSignaturePad =
      key.currentState!.context.findRenderObject()! as RenderSignaturePad;
      data = await ImageConverter.toImage(renderSignaturePad: renderSignaturePad);
    } else {
      final ui.Image imageData = await key.currentState!.toImage(pixelRatio: 3.0);
      final ByteData? bytes = await imageData.toByteData(format: ui.ImageByteFormat.png);
      if (bytes != null) {
        data = bytes.buffer.asUint8List();
      }
    }

    mipokaCustomToast("Menyimpan data ...");
    tandaTangan = await uploadBytesToFirebase(data!, "signature$uniqueId.png");

    if(context.mounted) {
      context.read<SessionBloc>().add(
        UpdateSessionEvent(
          session: session.copyWith(
            tandaTanganSA: tandaTangan,
            status: disetujui,
          ),
        ),
      );

      // Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);

      mipokaCustomToast("Sarana dan Prasarana disetujui.");
    }
  }
}
