import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/delete_file.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
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
  const PenggunaPengajuanUsulanKegiatan1({super.key});

  @override
  State<PenggunaPengajuanUsulanKegiatan1> createState() =>
      _PenggunaPengajuanUsulanKegiatan1State();
}

class _PenggunaPengajuanUsulanKegiatan1State extends State<PenggunaPengajuanUsulanKegiatan1> {
  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _deskripsiKegiatanController = TextEditingController();
  final TextEditingController _tempatKegiatanController = TextEditingController();
  final TextEditingController _jumlahParsitipanController = TextEditingController();
  final TextEditingController _targetKegiatanController = TextEditingController();
  final TextEditingController _totalPendanaanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  final TextEditingController _tanggalKeberangkatanController = TextEditingController();
  final TextEditingController _tanggalKepulanganController = TextEditingController();

  String? _namaOrmawaController;
  String? _pembiayaanController;
  String? _bentukKegiatanController;
  bool? _bentukKegiatanSwitchController;
  bool? _tempatKegiatanSwitchController;
  bool? _jumlahParsitipanSwitchController;
  String? _customUrlController;

  @override
  void initState() {
    BlocProvider.of<UsulanKegiatanBloc>(context, listen: false)
        .add(ReadUsulanKegiatanEvent());
    super.initState();
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
          if (state is UsulanKegiatanLoading) {
            return const Text('Loading');
          } else if (state is UsulanKegiatanHasData) {

            _namaOrmawaController = state.usulanKegiatanList[0].ormawa.namaOrmawa;
            _namaKegiatanController.text = state.usulanKegiatanList[0].namaKegiatan;
            _deskripsiKegiatanController.text = state.usulanKegiatanList[0].deskripsiKegiatan;
            _tempatKegiatanController.text = state.usulanKegiatanList[0].tempatKegiatan;
            _jumlahParsitipanController.text = state.usulanKegiatanList[0].jumlahPartisipan.toString();
            _targetKegiatanController.text = state.usulanKegiatanList[0].targetKegiatan;
            _totalPendanaanController.text = state.usulanKegiatanList[0].totalPendana.toString();

            _customUrlController = state.usulanKegiatanList[0].tandaTanganOrmawa;

            // _keteranganController.text = state.usulanKegiatanList[0]
            // _waktuMulaiController
            // _waktuSelesaiController
            // _tanggalMulaiController
            // _tanggalSelesaiController
            // _tanggalKeberangkatanController
            // _tanggalKepulanganController

            // _namaOrmawaController
            // _pembiayaanController
            // _bentukKegiatanController
            // _bentukKegiatanSwitchController
            // _tempatKegiatanSwitchController
            // _jumlahParsitipanSwitchController
            // _signaturePadController
            // _customUrlController

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
                              print('Input $value to State Management BLoC or Database');
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
                              print('Input $value to State Management BLoC or Database');
                            }
                            _pembiayaanController = value;
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Nama Kegiatan'),
                        CustomTextField(controller: _namaKegiatanController),

                        MipokaCustomSwitchButton(
                          title: 'Bentuk Kegiatan A',
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
                        CustomTextField(controller: _deskripsiKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Tanggal Mulai Kegiatan'),
                        CustomDatePickerField(controller: _tanggalMulaiController),

                        const CustomFieldSpacer(),
                        buildTitle('Tanggal Selesai Kegiatan'),
                        CustomDatePickerField(controller: _tanggalSelesaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu Mulai Kegiatan'),
                        CustomTimePickerField(controller: _waktuMulaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu Selesai Kegiatan'),
                        CustomTimePickerField(controller: _waktuSelesaiController),

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
                                controller: _tanggalKeberangkatanController,
                              ),

                              const CustomFieldSpacer(),

                              buildTitle('Tanggal Kepulangan'),

                              CustomDatePickerField(
                                controller: _tanggalKepulanganController,
                              ),
                            ],
                          ),
                        ) :
                        const Center(),

                        MipokaCustomSwitchButton(
                          title: 'Jumlah Partisipan',
                          option1: 'Tim',
                          option2: 'Orang',
                          value: _jumlahParsitipanSwitchController,
                          onChanged: (value) {
                            _jumlahParsitipanSwitchController = value;
                          },
                        ),

                        CustomTextField(controller: _jumlahParsitipanController),
                        const CustomFieldSpacer(),

                        buildTitle('Target Kegiatan'),
                        CustomTextField(controller: _targetKegiatanController),

                        const CustomFieldSpacer(),
                        buildTitle('Total Pendanaan'),

                        CustomTextField(
                          controller: _totalPendanaanController,
                          textInputType: TextInputType.number,
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
                          fileName: 'https://storage.googleapis.com/mipoka_bucket/signature${state.usulanKegiatanList[0].user.nim}.png',
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
                                if (kDebugMode) {
                                  print(_bentukKegiatanSwitchController);
                                }
                                _tempatKegiatanSwitchController == false
                                    ? Navigator.pushNamed(context,
                                    penggunaPengajuanUsulanKegiatan2DKPageRoute)
                                    : Navigator.pushNamed(context,
                                    penggunaPengajuanUsulanKegiatan2LKPageRoute);

                                // context.read<UsulanKegiatanBloc>().add(
                                //   CreateUsulanKegiatanEvent(
                                //     usulanKegiatan: UsulanKegiatan(
                                //       namaKegiatan: _namaKegiatanController.text,
                                //     ),
                                //   ),
                                // );
                                  // UpdateUsulanKegiatanEvent(
                                  //   usulanKegiatan: state.usulanKegiatanList[0].copyWith(
                                  //     namaKegiatan: _namaKegiatanController.text,
                                  //   ),
                                  // ),

                                  // CreateUsulanKegiatanEvent(
                                  //   usulanKegiatan: state.usulanKegiatanList[0].copyWith(
                                  //     namaKegiatan: _namaKegiatanController.text,
                                  //   ),
                                  // ),

                                //   CreateUsulanKegiatanEvent(
                                //     usulanKegiatan: UsulanKegiatan(
                                //         idUsulan: idUsulan,
                                //         user: user,
                                //         ormawa: Ormawa(
                                //           idOrmawa: idOrmawa,
                                //           namaOrmawa: namaOrmawa,
                                //           pembina: pembina,
                                //           ketua: ketua,
                                //           wakil: wakil,
                                //           bendahara: bendahara,
                                //           jumlahAnggota: jumlahAnggota,
                                //           fotoPembina: fotoPembina,
                                //           fotoKetua: fotoKetua,
                                //           fotoWakil: fotoWakil,
                                //           fotoBendahara: fotoBendahara,
                                //         ),
                                //       pembiayaan: pembiayaan,
                                //       namaKegiatan: namaKegiatan,
                                //       bentukKegiatan: bentukKegiatan,
                                //       deskripsiKegiatan: deskripsiKegiatan,
                                //       tanggalMulaiKegiatan: tanggalMulaiKegiatan,
                                //       tanggalSelesaiKegiatan: tanggalSelesaiKegiatan,
                                //       waktuMulaiKegiatan: waktuMulaiKegiatan,
                                //       waktuSelesaiKegiatan: waktuSelesaiKegiatan,
                                //       tempatKegiatan: tempatKegiatan,
                                //       tanggalKeberangkatan: tanggalKeberangkatan,
                                //       tanggalKepulangan: tanggalKepulangan,
                                //       jumlahPartisipan: jumlahPartisipan,
                                //       targetKegiatan: targetKegiatan,
                                //       totalPendana: totalPendana,
                                //       tandaTanganOrmawa: tandaTanganOrmawa,
                                //       partisipan: Partisipan(
                                //         idPartisipan: idPartisipan,
                                //         nim: nim,
                                //         namaLengkap: namaLengkap,
                                //         nik: nik,
                                //         tempatLahir: tempatLahir,
                                //         tglLahir: tglLahir,
                                //         peran: peran,
                                //         dasarKirim: dasarKirim,
                                //       ),
                                //       rincianBiayaKegiatan: RincianBiayaKegiatan(
                                //         idRincianBiayaKegiatan: idRincianBiayaKegiatan,
                                //         namaBiayaKegiatan: namaBiayaKegiatan,
                                //         kuantiti: kuantiti,
                                //         hargaSatuan: hargaSatuan,
                                //         total: total,
                                //         keterangan: keterangan,
                                //       ),
                                //       ketuaOrmawa: ketuaOrmawa,
                                //       pembina: pembina,
                                //       latarBelakang: latarBelakang,
                                //       tujuanKegiatan: tujuanKegiatan,
                                //       manfaatKegiatan: manfaatKegiatan,
                                //       bentukPelaksanaanKegiatan: bentukPelaksanaanKegiatan,
                                //       targetPencapaianKegiatan: targetPencapaianKegiatan,
                                //       waktuDanTempatPelaksanaan: waktuDanTempatPelaksanaan,
                                //       rencanaAnggaranKegiatan: rencanaAnggaranKegiatan,
                                //       tertibAcara: tertibAcara,
                                //       perlengkapan: perlengkapan,
                                //       penutup: penutup,
                                //       postinganKegiatan: postinganKegiatan,
                                //       dokumentasiKegiatan: dokumentasiKegiatan,
                                //       tabulasiHasil: tabulasiHasil,
                                //       fakturPembayaran: fakturPembayaran,
                                //       status: status,
                                //       validasiPembina: validasiPembina,
                                //       roles: roles,
                                //       file: file,
                                //       updatedAt: updatedAt,
                                //       createdAt: createdAt,
                                //     ),
                                  // ),
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
          } else if (state is UsulanKegiatanError) {
            return Text(state.message);
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}