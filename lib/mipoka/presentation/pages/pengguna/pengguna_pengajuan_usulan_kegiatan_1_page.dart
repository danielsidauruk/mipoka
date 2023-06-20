import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drop_down_with_controller.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_dropdown_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_signature_pad.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_switch_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';

class PenggunaPengajuanUsulanKegiatan1 extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatan1({super.key});

  @override
  State<PenggunaPengajuanUsulanKegiatan1> createState() =>
      _PenggunaPengajuanUsulanKegiatan1State();
}

class _PenggunaPengajuanUsulanKegiatan1State extends State<PenggunaPengajuanUsulanKegiatan1> {
  bool bentukKegiatanValue = false;
  bool tempatKegiatan = false;

  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _deskripsiKegiatanController =
      TextEditingController();
  final TextEditingController _tempatKegiatanController = TextEditingController();
  final TextEditingController _jumlahParsitipanController =
      TextEditingController();
  final TextEditingController _targetKegiatanController =
      TextEditingController();
  final TextEditingController _totalPendanaanController =
      TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();

  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();

  final TextEditingController _tanggalKeberangkatanController = TextEditingController();
  final TextEditingController _tanggalKepulanganController = TextEditingController();

  String? dropDownItemController;

  @override
  void initState() {
    dropDownItemController = "Ormawa D";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Page reloaded');
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
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

                  CustomDropdownButton(
                    items: listNamaOrmawa,
                    onValueChanged: (value) {
                      print('Input $value to State Management BLoC');
                    },
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   height: 35,
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 2.0,
                  //     horizontal: 8.0,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(4.0),
                  //     border: Border.all(color: Colors.white),
                  //   ),
                  //   child: DropdownButton<String>(
                  //     value: dropDownItem,
                  //     icon: const Icon(Icons.arrow_drop_down),
                  //     isExpanded: true,
                  //     underline: const Center(),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         dropDownItem = value!;
                  //       });
                  //     },
                  //     items: listNamaOrmawa.map<DropdownMenuItem<String>>((String value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(value),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),

                  const CustomFieldSpacer(),

                  DropdownController(
                    list: listNamaOrmawa,
                    controller: dropDownItemController,
                    onValueChanged: (value) {
                      if (kDebugMode) {
                        print('Input $value to State Management BLoC or Database');
                      }
                      dropDownItemController = value;
                    },
                  ),
                  
                  const CustomFieldSpacer(),

                  buildTitle('Pembiayaan'),

                  CustomDropdownButton(
                    items: listPembiayaan,
                    onValueChanged: (value) {
                      print('Input $value to State Management BLoC');
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Kegiatan'),
                  CustomTextField(controller: _namaKegiatanController),
                  
                  // CustomTextField2(
                  //   onSubmitted: (value) => print('Value: $value'),
                  // ),

                  // Row(
                  //   children: [
                  //     buildTitle('Bentuk Kegiatan'),
                  //     const SizedBox(width: 4.0),
                  //     Switch(
                  //       value: bentukKegiatanValue,
                  //       onChanged: (bool newValue) {
                  //         setState(() => bentukKegiatanValue = newValue);
                  //       },
                  //     ),
                  //     const SizedBox(width: 4.0),
                  //     bentukKegiatanValue == false
                  //         ? buildTitle('Daring')
                  //         : buildTitle('Luring'),
                  //   ],
                  // ),

                  CustomSwitch(
                    title: 'Bentuk Kegiatan',
                    option1: 'Daring',
                    option2: 'Luring',
                    onChanged: (value) {},
                  ),

                  CustomDropdownButton(
                    items: listBentukKegiatan,
                    onValueChanged: (value) {
                      print('Input "$value" to State Management BLoC');
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

                  CustomSwitch(
                    title: 'Tempat Kegiatan',
                    option1: 'Dalam Kota',
                    option2: 'Luar Kota',
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        tempatKegiatan = value;
                      });
                    },
                  ),

                  CustomTextField(controller: _tempatKegiatanController),

                  const CustomFieldSpacer(),

                  tempatKegiatan == true
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

                  CustomSwitch(
                    title: 'Jumlah Parsitipan',
                    option1: 'Tim',
                    option2: 'Orang',
                    onChanged: (value) {
                      print(value);
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
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     padding: const EdgeInsets.all(8.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5.0),
                  //       border: Border.all(color: Colors.white),
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         tandaTangan != true
                  //             ? InkWell(
                  //           onTap: () {
                  //             setState(() => tandaTangan = !tandaTangan);
                  //           },
                  //           child: const Text(
                  //             'Tekan untuk tanda tangan',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //         )
                  //             : const Center(),
                  //         tandaTangan == true
                  //             ? Column(
                  //           children: [
                  //             const CustomFieldSpacer(height: 4.0),
                  //             SfSignaturePad(
                  //               key: signatureGlobalKey,
                  //               backgroundColor: Colors.white,
                  //               strokeColor: Colors.black,
                  //               minimumStrokeWidth: 1.0,
                  //               maximumStrokeWidth: 4.0,
                  //             ),
                  //             const CustomFieldSpacer(),
                  //             Row(
                  //               mainAxisAlignment:
                  //               MainAxisAlignment.spaceEvenly,
                  //               children: [
                  //                 InkWell(
                  //                   onTap: () {
                  //                     setState(() =>
                  //                     tandaTangan = !tandaTangan);
                  //                   },
                  //                   child: const Text(
                  //                     'Tutup',
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 InkWell(
                  //                   onTap: _handleClearButtonPressed,
                  //                   child: const Text(
                  //                     'Clear',
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ) :
                  //         const Center(),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  CustomSignaturePad(),

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
                          print(dropDownItemController);
                          tempatKegiatan == false
                              ? Navigator.pushNamed(context,
                              penggunaPengajuanUsulanKegiatan2DKPageRoute)
                              : Navigator.pushNamed(context,
                              penggunaPengajuanUsulanKegiatan2LKPageRoute);
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
      ),
    );

  }

  // void _handleSaveButtonPressed() async {
  //   final data =
  //   await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
  //   final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  //   await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) {
  //         return Scaffold(
  //           appBar: AppBar(),
  //           body: Center(
  //             child: Container(
  //               color: Colors.grey[300],
  //               child: Image.memory(bytes!.buffer.asUint8List()),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}


// Scaffold buildWebPage(BuildContext context) {
//   return Scaffold(
//     appBar: const CustomMipokaWebAppBar(),
//     drawer: const MobileCustomPenggunaDrawerWidget(),
//     body: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const CustomMobileTitle(
//                 text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
//             const CustomFieldSpacer(),
//             CustomContentBox(
//               children: [
//                 buildTitle('Nama Ormawa'),
//                 CustomDropdownButton(
//                   value: ormawaDropDownValue,
//                   items: listNamaOrmawa,
//                   onChanged: (String? value) {
//                     setState(() => ormawaDropDownValue = value!);
//                   },
//                 ),
//                 const CustomFieldSpacer(),
//                 buildTitle('Pembiayaan'),
//                 CustomDropdownButton(
//                   value: pembiayaanDropDownValue,
//                   items: listPembiayaan,
//                   onChanged: (String? value) {
//                     setState(() => pembiayaanDropDownValue = value!);
//                   },
//                 ),
//                 const CustomFieldSpacer(),
//                 buildTitle('Nama Kegiatan'),
//                 CustomTextField(controller: _namaKegiatanController),
//                 Row(
//                   children: [
//                     buildTitle('Bentuk Kegiatan'),
//                     const SizedBox(width: 4.0),
//                     Switch(
//                       value: bentukKegiatanValue,
//                       onChanged: (bool newValue) {
//                         setState(() => bentukKegiatanValue = newValue);
//                       },
//                     ),
//                     const SizedBox(width: 4.0),
//                     bentukKegiatanValue == false
//                         ? buildTitle('Daring')
//                         : buildTitle('Luring'),
//                   ],
//                 ),
//                 CustomDropdownButton(
//                   value: bentukKegiatanDropDownValue,
//                   items: listBentukKegiatan,
//                   onChanged: (String? value) {
//                     setState(() => bentukKegiatanDropDownValue = value!);
//                   },
//                 ),
//                 const CustomFieldSpacer(),
//                 buildTitle('Deskripsi Kegiatan'),
//                 CustomTextField(controller: _deskripsiKegiatanController),
//                 const CustomFieldSpacer(),
//                 buildTitle('Tanggal Mulai Kegiatan'),
//                 CustomDatePickerField(
//                   selectedDate: tanggalMulaiKegiatan,
//                   onDateSelected: (value) {
//                     setState(() {
//                       tanggalMulaiKegiatan = value;
//                     });
//                   },
//                 ),
//                 const CustomFieldSpacer(),
//                 buildTitle('Tanggal Selesai Kegiatan'),
//                 CustomDatePickerField(
//                   selectedDate: tanggalSelesaiKegiatan,
//                   onDateSelected: (value) {
//                     setState(() {
//                       tanggalSelesaiKegiatan = value;
//                     });
//                   },
//                 ),
//                 const CustomFieldSpacer(),
//                 buildTitle('Waktu Mulai Kegiatan'),
//                 CustomTimePickerField(
//                   selectedTime: waktuMulaiKegiatan,
//                   onTimeSelected: (TimeOfDay time) {
//                     waktuMulaiKegiatan = time;
//                   },
//                 ),
//                 const CustomFieldSpacer(),
//                 buildTitle('Waktu Selesai Kegiatan'),
//                 CustomTimePickerField(
//                   selectedTime: waktuSelesaiKegiatan,
//                   onTimeSelected: (TimeOfDay time) {
//                     waktuSelesaiKegiatan = time;
//                   },
//                 ),
//                 Row(
//                   children: [
//                     buildTitle('Tempat Kegiatan Kegiatan'),
//                     const SizedBox(width: 4.0),
//                     Switch(
//                       value: tempatKegiatan,
//                       onChanged: (bool newValue) {
//                         setState(() => tempatKegiatan = newValue);
//                       },
//                     ),
//                     const SizedBox(width: 4.0),
//                     Expanded(
//                       child: tempatKegiatan == false
//                           ? buildTitle('Dalam Kota')
//                           : buildTitle('Luar Kota'),
//                     ),
//                   ],
//                 ),
//                 CustomTextField(controller: _tempatKegiatanController),
//                 const CustomFieldSpacer(),
//                 tempatKegiatan != false
//                     ? SizedBox(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       buildTitle('Tanggal Keberangkatan'),
//                       CustomDatePickerField(
//                         selectedDate: tanggalKeberangkatan,
//                         onDateSelected: (value) {
//                           setState(() {
//                             tanggalKeberangkatan = value;
//                           });
//                         },
//                       ),
//                       const CustomFieldSpacer(),
//                       buildTitle('Tanggal Kepulangan'),
//                       CustomDatePickerField(
//                         selectedDate: tanggalKepulangan,
//                         onDateSelected: (value) {
//                           setState(() {
//                             tanggalKepulangan = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//                     : const Center(),
//                 const CustomFieldSpacer(),
//
//                 // CustomSwitchField(
//                 //   title: 'Jumlah Partisipan',
//                 //   value: jenisPartisipan,
//                 //   option1: 'Tim',
//                 //   option2: 'Orang',
//                 //   onChanged: (bool newValue) {
//                 //     setState(() {
//                 //       jenisPartisipan = newValue;
//                 //     });
//                 //   }
//                 // ),
//
//                 Row(
//                   children: [
//                     buildTitle('Jumlah Parsitipan'),
//                     const SizedBox(width: 4.0),
//                     Switch(
//                       value: jenisPartisipan,
//                       onChanged: (bool newValue) {
//                         setState(() => jenisPartisipan = newValue);
//                       },
//                     ),
//                     const SizedBox(width: 4.0),
//                     Expanded(
//                       child: jenisPartisipan == false
//                           ? buildTitle('Tim')
//                           : buildTitle('Orang'),
//                     ),
//                   ],
//                 ),
//                 CustomTextField(controller: _jumlahParsitipanController),
//                 const CustomFieldSpacer(),
//                 buildTitle('Target Kegiatan'),
//                 CustomTextField(controller: _targetKegiatanController),
//                 const CustomFieldSpacer(),
//                 buildTitle('Total Pendanaan'),
//                 CustomTextField(controller: _totalPendanaanController),
//                 const CustomFieldSpacer(),
//                 buildTitle('Keterangan'),
//                 CustomTextField(controller: _keteranganController),
//                 const CustomFieldSpacer(),
//                 buildTitle('Tanda Tangan Ormawa'),
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.0),
//                       border: Border.all(color: Colors.white),
//                     ),
//                     child: Column(
//                       children: [
//                         tandaTangan != true
//                             ? InkWell(
//                           onTap: () {
//                             setState(() => tandaTangan = !tandaTangan);
//                           },
//                           child: const Text(
//                             'Tekan untuk tanda tangan',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         )
//                             : const Center(),
//                         tandaTangan == true
//                             ? Column(
//                           children: [
//                             const CustomFieldSpacer(height: 4.0),
//                             SfSignaturePad(
//                               key: signatureGlobalKey,
//                               backgroundColor: Colors.white,
//                               strokeColor: Colors.black,
//                               minimumStrokeWidth: 1.0,
//                               maximumStrokeWidth: 4.0,
//                             ),
//                             const CustomFieldSpacer(),
//                             Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() =>
//                                     tandaTangan = !tandaTangan);
//                                   },
//                                   child: const Text(
//                                     'Tutup',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: _handleClearButtonPressed,
//                                   child: const Text(
//                                     'Clear',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                             : const Center(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const CustomFieldSpacer(),
//                 CustomButton(
//                   onTap: () {
//                     tempatKegiatan == false
//                         ? Navigator.pushNamed(context,
//                         penggunaPengajuanUsulanKegiatan2DKPageRoute)
//                         : Navigator.pushNamed(context,
//                         penggunaPengajuanUsulanKegiatan2LKPageRoute);
//                   },
//                   text: 'Berikutnya',
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }