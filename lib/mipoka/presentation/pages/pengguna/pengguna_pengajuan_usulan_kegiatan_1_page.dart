import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
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
    User? user = FirebaseAuth.instance.currentUser;
    Future.microtask(() {
      context.read<UsulanKegiatanBloc>().add(
          ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan));
      context.read<MipokaUserBloc>().add(
        ReadMipokaUserEvent(idMipokaUser: user!.uid)
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<UsulanKegiatanBloc>(context, listen: false).close();
    BlocProvider.of<MipokaUserBloc>(context, listen: false).close();
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
  String? _customUrlController;

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
        builder: (context, usulanState) {
          return BlocBuilder<MipokaUserBloc, MipokaUserState>(
            builder: (context, mipokaUserState) {
              if (usulanState is UsulanKegiatanLoading) {
                return const Text('Loading');
              } else if (usulanState is UsulanKegiatanHasData) {
                _namaOrmawaController = 'Ormawa A';
                _namaKegiatanController.text = usulanState.usulanKegiatan.namaKegiatan;
                _deskripsiKegiatanController.text =
                    usulanState.usulanKegiatan.deskripsiKegiatan;
                _tempatKegiatanController.text =
                    usulanState.usulanKegiatan.fotoTempatKegiatan;
                _jumlahParsitipanController.text =
                    usulanState.usulanKegiatan.jumlahPartisipan.toString();
                _targetKegiatanController.text =
                    usulanState.usulanKegiatan.targetKegiatan;
                _totalPendanaanController.text =
                    usulanState.usulanKegiatan.totalPendanaan;

                // _customUrlController = state.usulanKegiatan.tandaTanganOrmawa;
                _customUrlController = "";

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
                                  setState(() {
                                    _tempatKegiatanSwitchController = value;
                                  });
                                },
                              ),

                              CustomTextField(controller: _tempatKegiatanController),

                              const CustomFieldSpacer(),

                              _tempatKegiatanSwitchController == true
                                  ? SizedBox(
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
                              )
                                  : const Center(),

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

                              // Container(
                              //   alignment: Alignment.center,
                              //   padding: const EdgeInsets.all(8.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(5.0),
                              //     border: Border.all(color: Colors.white),
                              //   ),
                              //   child: _signaturePadController
                              //       ? Column(
                              //     children: [
                              //       Image.network(_customUrlController!),
                              //       const SizedBox(height: 4.0),
                              //       InkWell(
                              //         onTap: () {
                              //           deleteFile(_customUrlController!);
                              //           setState(() {
                              //             _signaturePadController = false;
                              //           });
                              //         },
                              //         child: const Text(
                              //           'Delete',
                              //           style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: 16,
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   )
                              //       : CustomSignaturePad(
                              //     customUrl: 'https://storage.googleapis.com/mipoka_bucket/signatureB.png',
                              //     onPressed: (value) {
                              //       setState(() {
                              //         _signaturePadController = true;
                              //         // _customUrlController = 'https://storage.googleapis.com/mipoka_bucket/signatureB.png';
                              //       });
                              //     },
                              //   ),
                              // ),

                              CustomSignaturePad(
                                signatureUrl: _customUrlController,
                                fileName:
                                'https://storage.googleapis.com/mipoka_bucket/signature${DateTime.now().millisecondsSinceEpoch}.png',
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

                                      // Navigator.pushNamed(
                                      //   context,
                                      //   penggunaPengajuanUsulanKegiatan2LKPageRoute,
                                      //   arguments: widget.idUsulanKegiatan,
                                      // );

                                      context.read<UsulanKegiatanBloc>().add(
                                        UpdateUsulanKegiatanEvent(
                                          usulanKegiatan: usulanState.usulanKegiatan.copyWith(
                                            namaKegiatan: _namaKegiatanController.text,
                                          ),
                                        ),
                                      );

                                      _tempatKegiatanSwitchController == true ?
                                      Navigator.pushNamed(
                                        context,
                                        penggunaPengajuanUsulanKegiatan2LKPageRoute,
                                        arguments: widget.idUsulanKegiatan,
                                      ) :
                                      Navigator.pushNamed(
                                        context,
                                        penggunaPengajuanUsulanKegiatan2DKPageRoute,
                                        arguments: widget.idUsulanKegiatan,
                                      );
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
              } else if (usulanState is UsulanKegiatanError) {
                return Text('UsulanKegiatanBloc Error : ${usulanState.message}');
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

