import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/signature_cubit.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_signature_pad.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_switch.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

// class PenggunaPengajuanUsulanKegiatan1 extends StatefulWidget {
//   const PenggunaPengajuanUsulanKegiatan1({super.key});
//
//   @override
//   State<PenggunaPengajuanUsulanKegiatan1> createState() =>
//       _PenggunaPengajuanUsulanKegiatan1State();
// }
//
// class _PenggunaPengajuanUsulanKegiatan1State extends State<PenggunaPengajuanUsulanKegiatan1> {
//   final TextEditingController _namaKegiatanController = TextEditingController();
//   final TextEditingController _deskripsiKegiatanController = TextEditingController();
//   final TextEditingController _tempatKegiatanController = TextEditingController();
//   final TextEditingController _jumlahParsitipanController = TextEditingController();
//   final TextEditingController _targetKegiatanController = TextEditingController();
//   final TextEditingController _totalPendanaanController = TextEditingController();
//   final TextEditingController _keteranganController = TextEditingController();
//   final TextEditingController _waktuMulaiController = TextEditingController();
//   final TextEditingController _waktuSelesaiController = TextEditingController();
//   final TextEditingController _tanggalMulaiController = TextEditingController();
//   final TextEditingController _tanggalSelesaiController = TextEditingController();
//   final TextEditingController _tanggalKeberangkatanController = TextEditingController();
//   final TextEditingController _tanggalKepulanganController = TextEditingController();
//
//   String? _namaOrmawaController;
//   String? _pembiayaanController;
//   String? _bentukKegiatanController;
//   bool? _bentukKegiatanSwitchController;
//   bool? _tempatKegiatanSwitchController;
//   bool? _jumlahParsitipanSwitchController;
//   late bool _signaturePadController;
//   String? _customUrlController;
//
//   @override
//   void initState() {
//     _namaOrmawaController = "Ormawa B";
//     _tanggalKepulanganController.text = "13-01-2001";
//     _bentukKegiatanSwitchController = true;
//     _tempatKegiatanSwitchController = true;
//     _signaturePadController = true;
//     _customUrlController = 'https://storage.googleapis.com/mipoka_bucket/signature.png';
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (kDebugMode) {
//       print('Page reloaded');
//     }
//     _customUrlController = 'https://storage.googleapis.com/mipoka_bucket/signature.png';
//
//     return Scaffold(
//       appBar: const MipokaMobileAppBar(),
//       drawer: const MobileCustomPenggunaDrawerWidget(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const CustomMobileTitle(
//                   text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
//
//               const CustomFieldSpacer(),
//
//               CustomContentBox(
//                 children: [
//
//                   buildTitle('Nama Ormawa'),
//
//                   MipokaCustomDropdown(
//                     items: listNamaOrmawa,
//                     controller: _namaOrmawaController,
//                     onValueChanged: (value) {
//                       if (kDebugMode) {
//                         print('Input $value to State Management BLoC or Database');
//                       }
//                       _namaOrmawaController = value;
//                     },
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Pembiayaan'),
//
//                   MipokaCustomDropdown(
//                     items: listPembiayaan,
//                     controller: _pembiayaanController,
//                     onValueChanged: (value) {
//                       if (kDebugMode) {
//                         print('Input $value to State Management BLoC or Database');
//                       }
//                       _pembiayaanController = value;
//                     },
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Nama Kegiatan'),
//                   CustomTextField(controller: _namaKegiatanController),
//
//                   MipokaCustomSwitchButton(
//                     title: 'Bentuk Kegiatan A',
//                     option1: 'Daring',
//                     option2: 'Luring',
//                     value: _bentukKegiatanSwitchController,
//                     onChanged: (value) {
//                       _bentukKegiatanSwitchController = value;
//                       if (kDebugMode) {
//                         print(_bentukKegiatanSwitchController);
//                       }
//                     },
//                   ),
//
//                   MipokaCustomDropdown(
//                     items: listBentukKegiatan,
//                     controller: _bentukKegiatanController,
//                     onValueChanged: (value) {
//                       if (kDebugMode) {
//                         print('Input "$value" to State Management BLoC');
//                       }
//                       _bentukKegiatanController = value;
//                     },
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Deskripsi Kegiatan'),
//                   CustomTextField(controller: _deskripsiKegiatanController),
//
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Tanggal Mulai Kegiatan'),
//                   CustomDatePickerField(controller: _tanggalMulaiController),
//
//                   const CustomFieldSpacer(),
//                   buildTitle('Tanggal Selesai Kegiatan'),
//                   CustomDatePickerField(controller: _tanggalSelesaiController),
//
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Waktu Mulai Kegiatan'),
//                   CustomTimePickerField(controller: _waktuMulaiController),
//
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Waktu Selesai Kegiatan'),
//                   CustomTimePickerField(controller: _waktuSelesaiController),
//
//                   MipokaCustomSwitchButton(
//                     title: 'Tempat Kegiatan',
//                     option1: 'Dalam Kota',
//                     option2: 'Luar Kota',
//                     value: _tempatKegiatanSwitchController,
//                     onChanged: (value) {
//                       setState(() {
//                         _tempatKegiatanSwitchController = value;
//                       });
//                     },
//                   ),
//
//                   CustomTextField(controller: _tempatKegiatanController),
//
//                   const CustomFieldSpacer(),
//
//                   _tempatKegiatanSwitchController == true
//                       ? SizedBox(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         buildTitle('Tanggal Keberangkatan'),
//                         CustomDatePickerField(
//                           controller: _tanggalKeberangkatanController,
//                         ),
//
//                         const CustomFieldSpacer(),
//
//                         buildTitle('Tanggal Kepulangan'),
//
//                         CustomDatePickerField(
//                           controller: _tanggalKepulanganController,
//                         ),
//                       ],
//                     ),
//                   ) :
//                   const Center(),
//
//                   MipokaCustomSwitchButton(
//                     title: 'Jumlah Partisipan',
//                     option1: 'Tim',
//                     option2: 'Orang',
//                     value: _jumlahParsitipanSwitchController,
//                     onChanged: (value) {
//                         _jumlahParsitipanSwitchController = value;
//                     },
//                   ),
//
//                   CustomTextField(controller: _jumlahParsitipanController),
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Target Kegiatan'),
//                   CustomTextField(controller: _targetKegiatanController),
//
//                   const CustomFieldSpacer(),
//                   buildTitle('Total Pendanaan'),
//
//                   CustomTextField(
//                     controller: _totalPendanaanController,
//                     textInputType: TextInputType.number,
//                   ),
//                   const CustomFieldSpacer(),
//
//                   buildTitle('Keterangan'),
//                   CustomTextField(controller: _keteranganController),
//
//                   const CustomFieldSpacer(),
//                   buildTitle('Tanda Tangan Ormawa'),
//
//                   // => Get signature png from database (if exist)
//                   // => https://storage.googleapis.com/mipoka_bucket/signature.png
//                   // _signaturePadController == true ?
//                   // Container(
//                   //   alignment: Alignment.center,
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   decoration: BoxDecoration(
//                   //     borderRadius: BorderRadius.circular(5.0),
//                   //     border: Border.all(color: Colors.white),
//                   //   ),
//                   //   child: Column(
//                   //     children: [
//                   //       Image.network('https://storage.googleapis.com/mipoka_bucket/signaturea.png'),
//                   //
//                   //       const SizedBox(height: 4.0,),
//                   //
//                   //       InkWell(
//                   //         onTap: () {
//                   //           setState(() {
//                   //             // Delete the image from Cloud Bucket
//                   //             deleteFile('https://storage.googleapis.com/mipoka_bucket/signaturea.png');
//                   //             _signaturePadController = false;
//                   //           });
//                   //         },
//                   //         child: const Text(
//                   //           'Clear',
//                   //           style: TextStyle(
//                   //             color: Colors.white,
//                   //             fontSize: 16,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ) :
//                   // CustomSignaturePad(
//                   //   // link based on user's nim and Datetime now
//                   //   customUrl: 'https://storage.googleapis.com/mipoka_bucket/signaturea.png',
//                   //   onPressed: (value){
//                   //     setState(() {
//                   //       // _signaturePadController = value;
//                   //     });
//                   //   },
//                   // ),
//
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.0),
//                       border: Border.all(color: Colors.white),
//                     ),
//                     child: _signaturePadController
//                         ? Column(
//                       children: [
//                         Image.network(_customUrlController!),
//                         const SizedBox(height: 4.0),
//                         InkWell(
//                           onTap: () {
//                             deleteFile(_customUrlController!);
//                             setState(() {
//                               _signaturePadController = false;
//                             });
//                           },
//                           child: const Text(
//                             'Delete',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                         : CustomSignaturePad(
//                       customUrl: _customUrlController!,
//                       onPressed: (value) {
//                         setState(() {
//                           _signaturePadController = value;
//                         });
//                       },
//                     ),
//                   ),
//
//                   const CustomFieldSpacer(),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CustomMipokaButton(
//                         onTap: () => Navigator.pop(context),
//                         text: 'Batal',
//                       ),
//
//                       const SizedBox(width: 8.0),
//
//                       CustomMipokaButton(
//                         onTap: () {
//                           if (kDebugMode) {
//                             print(_bentukKegiatanSwitchController);
//                           }
//                           _tempatKegiatanSwitchController == false
//                               ? Navigator.pushNamed(context,
//                               penggunaPengajuanUsulanKegiatan2DKPageRoute)
//                               : Navigator.pushNamed(context,
//                               penggunaPengajuanUsulanKegiatan2LKPageRoute);
//                         },
//                         text: 'Berikutnya',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class PenggunaPengajuanUsulanKegiatan1 extends StatefulWidget {
  final int idUsulanKegiatan;
  const PenggunaPengajuanUsulanKegiatan1({
    super.key,
    required this.idUsulanKegiatan,
  });

  @override
  State<PenggunaPengajuanUsulanKegiatan1> createState() =>
      _PenggunaPengajuanUsulanKegiatan1State();
}

class _PenggunaPengajuanUsulanKegiatan1State
    extends State<PenggunaPengajuanUsulanKegiatan1> {

  @override
  void initState() {
    Future.microtask(() {
      context.read<UsulanKegiatanBloc>().add(
          ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan));
      context.read<MipokaUserBloc>().add(
        ReadMipokaUserEvent(idMipokaUser: user!.uid));
      context.read<TempatKegiatanCubit>();
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    context.read<MipokaUserBloc>().close();
    context.read<TempatKegiatanCubit>().close();
    super.dispose();
  }

  String? _namaOrmawaController;
  String? _pembiayaanController;
  final TextEditingController _namaKegiatanController = TextEditingController();
  bool? _bentukKegiatanSwitchController;
  String? _bentukKegiatanController;
  // _bentukKegiatanController ?? "Luring" : "Daring"
  final TextEditingController _deskripsiKegiatanController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _tanggalKeberangkatanController = TextEditingController();
  final TextEditingController _tanggalKepulanganController = TextEditingController();
  bool? _tempatKegiatanSwitchController;
  // _tempatKegiatanSwitchController ?? "Luar Kota" : "Dalam Kota"
  final TextEditingController _tempatKegiatanController = TextEditingController();
  final TextEditingController _targetKegiatanController = TextEditingController();
  bool? _jumlahParsitipanSwitchController;
  // _jumlahParsitipanSwitchController ?? "Orang" : "Tim"
  final TextEditingController _jumlahParsitipanController = TextEditingController();
  final TextEditingController _totalPendanaanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final StreamController<String?> _ormawaSignatureStream = StreamController<String?>();
  String? _ormawaSignatureController;
  User? user = FirebaseAuth.instance.currentUser;

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
    if (kDebugMode) {
      print('Page reloaded');
    }
    // _customUrlController = 'https://storage.googleapis.com/mipoka_bucket/signature.png';

    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
        builder: (context, state) {
          return BlocBuilder<MipokaUserBloc, MipokaUserState>(
            builder: (context, mipokaUserState) {
              if (state is UsulanKegiatanLoading) {
                return const Text('Loading');
              } else if (state is UsulanKegiatanHasData) {
                final usulanKegiatan = state.usulanKegiatan;

                _namaOrmawaController = 'Ormawa A';
                _namaKegiatanController.text = usulanKegiatan.namaKegiatan;
                _deskripsiKegiatanController.text = usulanKegiatan.deskripsiKegiatan;
                _tempatKegiatanController.text = usulanKegiatan.fotoTempatKegiatan;
                _jumlahParsitipanController.text = usulanKegiatan.jumlahPartisipan.toString();
                _targetKegiatanController.text = usulanKegiatan.targetKegiatan;
                _totalPendanaanController.text = usulanKegiatan.totalPendanaan;

                _ormawaSignatureController = "";

                if(mipokaUserState is MipokaUserLoading) {
                  return const Text('Loading');
                } else if (mipokaUserState is MipokaUserHasData) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomMobileTitle(
                              text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
                          const CustomFieldSpacer(),
                          CustomContentBox(
                            children: [
                              buildTitle('Nama Ormawa'),

                              MipokaCustomDropdown(
                                items: listNamaOrmawa,
                                controller: _namaOrmawaController,
                                onValueChanged: (value) {
                                  if (kDebugMode) {
                                    print(
                                        'Input $value to State Management BLoC or Database');
                                  }
                                  _namaOrmawaController = value;
                                },
                              ),

                              const CustomFieldSpacer(),

                              buildTitle('Pembiayaan'),

                              MipokaCustomDropdown(
                                items: listPembiayaan,
                                controller: _pembiayaanController,
                                onValueChanged: (value) {
                                  if (kDebugMode) {
                                    print(
                                        'Input $value to State Management BLoC or Database');
                                  }
                                  _pembiayaanController = value;
                                },
                              ),

                              const CustomFieldSpacer(),

                              buildTitle('Nama Kegiatan'),
                              CustomTextField(controller: _namaKegiatanController),

                              MipokaCustomSwitchButton(
                                title: 'Bentuk Kegiatan',
                                option1: 'Daring',
                                option2: 'Luring',
                                value: _bentukKegiatanSwitchController,
                                onChanged: (value) {
                                  _bentukKegiatanSwitchController = value;
                                  if (kDebugMode) {
                                    print(_bentukKegiatanSwitchController);
                                  }
                                },
                              ),

                              MipokaCustomDropdown(
                                items: listBentukKegiatan,
                                controller: _bentukKegiatanController,
                                onValueChanged: (value) {
                                  if (kDebugMode) {
                                    print('Input "$value" to State Management BLoC');
                                  }
                                  _bentukKegiatanController = value;
                                },
                              ),

                              const CustomFieldSpacer(),

                              buildTitle('Deskripsi Kegiatan'),
                              CustomTextField(
                                  controller: _deskripsiKegiatanController),

                              const CustomFieldSpacer(),

                              buildTitle('Tanggal Mulai Kegiatan'),
                              CustomDatePickerField(
                                  controller: _tanggalMulaiController),

                              const CustomFieldSpacer(),
                              buildTitle('Tanggal Selesai Kegiatan'),
                              CustomDatePickerField(
                                  controller: _tanggalSelesaiController),

                              const CustomFieldSpacer(),

                              buildTitle('Waktu Mulai Kegiatan'),
                              CustomTimePickerField(
                                  controller: _waktuMulaiController),

                              const CustomFieldSpacer(),

                              buildTitle('Waktu Selesai Kegiatan'),
                              CustomTimePickerField(
                                  controller: _waktuSelesaiController),

                              MipokaCustomSwitchButton(
                                title: 'Tempat Kegiatan',
                                option1: 'Dalam Kota',
                                option2: 'Luar Kota',
                                value: _tempatKegiatanSwitchController,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _tempatKegiatanSwitchController = value;
                                  // });
                                  _tempatKegiatanSwitchController = value;
                                  context.read<TempatKegiatanCubit>().setTempatKegiatan(value);
                                },
                              ),

                              CustomTextField(controller: _tempatKegiatanController),

                              const CustomFieldSpacer(),

                              BlocProvider<TempatKegiatanCubit>.value(
                                  value: context.read<TempatKegiatanCubit>(),
                                  child: BlocBuilder<TempatKegiatanCubit, bool> (
                                      builder: (context, isTempatKegiatan) {
                                        return isTempatKegiatan == true ?
                                        SizedBox(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              buildTitle('Tanggal Keberangkatan'),
                                              CustomDatePickerField(
                                                controller:
                                                _tanggalKeberangkatanController,
                                              ),
                                              const CustomFieldSpacer(),
                                              buildTitle('Tanggal Kepulangan'),
                                              CustomDatePickerField(
                                                controller: _tanggalKepulanganController,
                                              ),
                                            ],
                                          ),
                                        ) :
                                        const Center();
                                      }
                                  )
                              ),

                              MipokaCustomSwitchButton(
                                title: 'Jumlah Partisipan',
                                option1: 'Tim',
                                option2: 'Orang',
                                value: _jumlahParsitipanSwitchController,
                                onChanged: (value) {
                                  _jumlahParsitipanSwitchController = value;
                                },
                              ),

                              CustomTextField(
                                  controller: _jumlahParsitipanController),
                              const CustomFieldSpacer(),

                              buildTitle('Target Kegiatan'),
                              CustomTextField(controller: _targetKegiatanController),

                              // const CustomFieldSpacer(),
                              // buildTitle('Total Pendanaan'),

                              MipokaCustomSwitchButton(
                                title: 'Total Pendanaan',
                                option1: 'Uang',
                                option2: 'Dll',
                                value: _jumlahParsitipanSwitchController,
                                onChanged: (value) {
                                  _jumlahParsitipanSwitchController = value;
                                },
                              ),

                              CustomTextField(
                                controller: _totalPendanaanController,
                                // textInputType: TextInputType.number,
                              ),
                              const CustomFieldSpacer(),

                              buildTitle('Keterangan'),
                              CustomTextField(controller: _keteranganController),

                              const CustomFieldSpacer(),
                              buildTitle('Tanda Tangan Ormawa'),

                              // TODO: CUSTOM SIGNATURE PAD

                              // CustomSignaturePad(
                              //   signatureUrl: _ormawaSignatureController,
                              //   fileName: "signature${user?.uid ?? ""}",
                              // ),

                              StreamBuilder<String?>(
                                stream: _ormawaSignatureStream.stream,
                                builder: (context, snapshot) {
                                  String text = snapshot.data ?? "";
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
                                                if (_ormawaSignatureController == "")
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
                                                  ) :
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
                                                              _ormawaSignatureController = await uploadFileFromSignature(file, "signature${user?.uid ?? "unknown"}");
                                                              // uploadFile(file: file, customUrl: widget.fileName);
                                                            },
                                                            child: const InkWell(
                                                              child: Text(
                                                                'Simpan',
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              context.read<SignatureCubit>().toggleSignature();
                                                              deleteFileFromFirebase(_ormawaSignatureController ?? "");
                                                              _ormawaSignatureController = "";
                                                            },
                                                            child: const Text(
                                                              'Batal',
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                if (_ormawaSignatureController != "")
                                                  Column(
                                                    children: [
                                                      Image.network(_ormawaSignatureController ?? ""),

                                                      const CustomFieldSpacer(),

                                                      InkWell(
                                                        onTap: () {
                                                          context.read<SignatureCubit>().toggleSignature();
                                                          deleteFileFromFirebase(_ormawaSignatureController ?? "");
                                                          _ormawaSignatureController = "";
                                                        },
                                                        child: const Text(
                                                          'Hapus',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),

                              const CustomFieldSpacer(),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomMipokaButton(
                                    onTap: () => Navigator.pop(context),
                                    text: 'Batal',
                                  ),
                                  const SizedBox(width: 8.0),
                                  CustomMipokaButton(
                                    onTap: () {

                                      print(_ormawaSignatureController);

                                      // Navigator.pushNamed(
                                      //   context,
                                      //   penggunaPengajuanUsulanKegiatan2LKPageRoute,
                                      //   arguments: widget.idUsulanKegiatan,
                                      // );

                                      // context.read<UsulanKegiatanBloc>().add(
                                      //   UpdateUsulanKegiatanEvent(
                                      //     usulanKegiatan: state.usulanKegiatan.copyWith(
                                      //       namaKegiatan: _namaKegiatanController.text,
                                      //     ),
                                      //   ),
                                      // );

                                      // _tempatKegiatanSwitchController == true ?
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   penggunaPengajuanUsulanKegiatan2LKPageRoute,
                                      //   arguments: widget.idUsulanKegiatan,
                                      // ) :
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   penggunaPengajuanUsulanKegiatan2DKPageRoute,
                                      //   arguments: widget.idUsulanKegiatan,
                                      // );
                                    },
                                    text: 'Berikutnya',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (mipokaUserState is MipokaUserError) {
                  return Text('MipokaUserBloc Error : ${mipokaUserState.message}');
                } else {
                  return const Text('MipokaUserBloc has not been triggered');
                }
              } else if (state is UsulanKegiatanError) {
                return Text('UsulanKegiatanBloc Error : ${state.message}');
              } else {
                return const Text('UsulanKegiatanBloc has not been triggered');
              }
            },
          );
        },
      ),
    );
  }
}

class TempatKegiatanCubit extends Cubit<bool> {
  TempatKegiatanCubit() : super(false);

  void setTempatKegiatan(bool value) {
    emit(value);
  }
}

Future<String> uploadFileFromSignature(File file, String fileName) async {
  try {
    final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

    final UploadTask uploadTask = storageRef.putFile(file);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    mipokaCustomToast('File uploaded successfully');
    return downloadUrl;
  } catch (error) {
    mipokaCustomToast("Failed while uploading file: $error");
    rethrow;
  }
}
