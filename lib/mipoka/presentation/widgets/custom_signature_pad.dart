import 'dart:io';
import 'dart:ui' as ui;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/domain/utils/delete_file.dart';
import 'package:mipoka/domain/utils/upload_file.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/signature_cubit.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:path_provider/path_provider.dart';
//
// class CustomSignaturePad extends StatelessWidget {
//   final String customUrl;
//   final void Function(bool) onPressed;
//
//   CustomSignaturePad({
//     super.key,
//     required this.customUrl,
//     required this.onPressed,
//   });
//
//   final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey<SfSignaturePadState>();
//
//   Future<File> saveSignature() async {
//     final image = await signatureGlobalKey.currentState?.toImage(pixelRatio: 3.0);
//     final byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
//     final bytes = byteData?.buffer.asUint8List();
//
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/signature.png');
//     await file.writeAsBytes(bytes!);
//
//     return file;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<SignatureCubit>(
//       create: (context) => SignatureCubit(),
//       child: BlocBuilder<SignatureCubit, SignatureState>(
//         builder: (context, state) {
//           return InkWell(
//             onTap: () => context.read<SignatureCubit>().toggleSignature(),
//             child: Column(
//               children: [
//                 !state.isSignatureVisible
//                     ? InkWell(
//                   onTap: () {
//                     context.read<SignatureCubit>().toggleSignature();
//                   },
//                   child: const Text(
//                     'Tekan untuk tanda tangan',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ) : const Center(),
//                 state.isSignatureVisible
//                     ? Column(
//                   children: [
//                     const CustomFieldSpacer(height: 4.0),
//                     SfSignaturePad(
//                       key: signatureGlobalKey,
//                       backgroundColor: Colors.white,
//                       strokeColor: Colors.black,
//                       minimumStrokeWidth: 1.0,
//                       maximumStrokeWidth: 4.0,
//                     ),
//                     const CustomFieldSpacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             File signatureFile = await saveSignature();
//                             uploadFile(
//                               file: signatureFile,
//                               customUrl: customUrl,
//                             );
//                             context.read<SignatureCubit>().saveSignatureUrl(customUrl);
//                             onPressed(true);
//                           },
//                           child: const Text(
//                             'Save',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             signatureGlobalKey.currentState?.clear();
//                           },
//                           child: const Text(
//                             'Clear',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ) :
//                 const Center(),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return BlocBuilder<SignatureCubit, SignatureState>(
//   //     builder: (context, state) {
//   //       return InkWell(
//   //         onTap: () => context.read<SignatureCubit>().toggleSignature(),
//   //         child: Column(
//   //           children: [
//   //             !state.isSignatureVisible
//   //                 ? InkWell(
//   //               onTap: () {
//   //                 context.read<SignatureCubit>().toggleSignature();
//   //               },
//   //               child: const Text(
//   //                 'Tekan untuk tanda tangan',
//   //                 style: TextStyle(
//   //                   color: Colors.white,
//   //                   fontSize: 16,
//   //                 ),
//   //               ),
//   //             )
//   //                 : const Center(),
//   //             state.isSignatureVisible
//   //                 ? Column(
//   //               children: [
//   //                 const CustomFieldSpacer(height: 4.0),
//   //                 SfSignaturePad(
//   //                   key: signatureGlobalKey,
//   //                   backgroundColor: Colors.white,
//   //                   strokeColor: Colors.black,
//   //                   minimumStrokeWidth: 1.0,
//   //                   maximumStrokeWidth: 4.0,
//   //                 ),
//   //                 const CustomFieldSpacer(),
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //                   children: [
//   //                     InkWell(
//   //                       onTap: () async {
//   //                         File signatureFile = await saveSignature();
//   //                         uploadFile(
//   //                           file: signatureFile,
//   //                           customUrl: customUrl,
//   //                         );
//   //
//   //                         context.read<SignatureCubit>().saveSignatureUrl(customUrl);
//   //
//   //                         onPressed(true);
//   //                       },
//   //                       child: const Text(
//   //                         'Save',
//   //                         style: TextStyle(
//   //                           color: Colors.white,
//   //                           fontSize: 16,
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     InkWell(
//   //                       onTap: () {
//   //                         signatureGlobalKey.currentState?.clear();
//   //                       },
//   //                       child: const Text(
//   //                         'Clear',
//   //                         style: TextStyle(
//   //                           color: Colors.white,
//   //                           fontSize: 16,
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ],
//   //             )
//   //                 : const Center(),
//   //             SignatureDisplay(
//   //               savedSignatureUrl: state.savedSignatureUrl,
//   //               onDelete: () {
//   //                 deleteFile(state.savedSignatureUrl!);
//   //                 context.read<SignatureCubit>().saveSignatureUrl(null);
//   //               },
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   }

class CustomSignaturePad extends StatefulWidget {
  final String signatureUrl;
  final String fileName;

  const CustomSignaturePad({
    super.key,
    required this.signatureUrl,
    required this.fileName,
  });

  @override
  State<CustomSignaturePad> createState() => _CustomSignaturePadState();
}

class _CustomSignaturePadState extends State<CustomSignaturePad> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey =
  GlobalKey<SfSignaturePadState>();

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
                  if (widget.signatureUrl == "")
                  !state.isSignatureVisible ?
                  InkWell(
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
                  ) : const Center(),

                  state.isSignatureVisible ?
                  Column(
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
                              final file = await saveSignature();
                              // context.read<SignatureCubit>().toggleSignature();
                              uploadFile(file: file, customUrl: 'https://storage.googleapis.com/mipoka_bucket/signature${widget.fileName}.png');
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
                              deleteFile('https://storage.googleapis.com/mipoka_bucket/signature${widget.fileName}.png');
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
                          InkWell(
                            onTap: () {
                              context.read<SignatureCubit>().toggleSignature();
                            },
                            child: const Text(
                              'Batal',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ) : const Center(),

                  if (widget.signatureUrl != "")
                    Image.network(widget.signatureUrl),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}