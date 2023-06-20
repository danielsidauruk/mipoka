import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/signature_cubit.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class CustomSignaturePad extends StatelessWidget {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey =
  GlobalKey<SfSignaturePadState>();

  CustomSignaturePad({super.key});

  Future<File> saveSignature() async {
    final image = await signatureGlobalKey.currentState?.toImage(pixelRatio: 3.0);
    final byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData?.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/signature.png');
    await file.writeAsBytes(bytes!);

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignatureCubit>(
      create: (context) => SignatureCubit(),
      child: BlocBuilder<SignatureCubit, SignatureState>(
        builder: (context, state) {
          return InkWell(
            onTap: () => context.read<SignatureCubit>().toggleSignature(),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                children: [
                  !state.isSignatureVisible
                      ? InkWell(
                    onTap: () {
                      context.read<SignatureCubit>().toggleSignature();
                    },
                    child: const Text(
                      'Tekan untuk tanda tangan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                      : const Center(),
                  state.isSignatureVisible
                      ? Column(
                    children: [
                      const CustomFieldSpacer(height: 4.0),
                      SfSignaturePad(
                        key: signatureGlobalKey,
                        backgroundColor: Colors.white,
                        strokeColor: Colors.black,
                        minimumStrokeWidth: 1.0,
                        maximumStrokeWidth: 4.0,
                      ),
                      const CustomFieldSpacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              File signatureFile = await saveSignature();
                              uploadFile(signatureFile);
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              signatureGlobalKey.currentState?.clear();
                            },
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                      : const Center(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


Future<void> uploadFile(File file) async {
  // try {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //
  //   String fileName = file.path.split('/').last;
  //
  //   Reference ref = storage.ref().child(fileName);
  //
  //   UploadTask uploadTask = ref.putFile(file);
  //   TaskSnapshot taskSnapshot = await uploadTask;
  //
  //   String downloadURL = await taskSnapshot.ref.getDownloadURL();
  //
  //   return downloadURL;
  // } catch (e) {
  //   return 'Error uploading file: $e';
  // }
  String storageUrl = 'https://storage.googleapis.com/usulan_kegiatan_output/signature.png';
  final uploadResponse = await http.put(Uri.parse(storageUrl), body: await file.readAsBytes());
  if (uploadResponse.statusCode == 200) {
    print('File uploaded successfully');
  } else {
    print('File upload failed');
  }
}


