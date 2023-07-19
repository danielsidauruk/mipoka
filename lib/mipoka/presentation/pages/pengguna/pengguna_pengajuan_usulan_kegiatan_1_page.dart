import 'dart:async';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/signature_cubit.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
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

class PenggunaPengajuanUsulanKegiatan1 extends StatefulWidget {
  final UsulanArgs usulanArgs;
  const PenggunaPengajuanUsulanKegiatan1({
    super.key,
    required this.usulanArgs,
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
          ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
      context.read<MipokaUserBloc>().add(
        ReadMipokaUserEvent(idMipokaUser: user!.uid));
      context.read<TempatKegiatanCubit>();
      context.read<OrmawaBloc>().add(ReadAllOrmawaEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    mipokaCustomToast('Sedang menyimpan data...', time: 5);
    context.read<UsulanKegiatanBloc>().close();
    context.read<MipokaUserBloc>().close();
    context.read<TempatKegiatanCubit>().close();
    super.dispose();
  }

  Ormawa? _ormawa;
  String? _pembiayaanController;
  final TextEditingController _namaKegiatanController = TextEditingController();
  String? _bentukKegiatanController;
  bool? _bentukKegiatanSwitchController;
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
  bool? _totalPendanaanSwitchController;
  // _totalPendanaanSwitchController ?? "Uang" : "Dll"
  final TextEditingController _totalPendanaanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  String? _ormawaSignatureController;

  // final LabeledGlobalKey<SfSignaturePadState> signatureGlobalKey = LabeledGlobalKey<SfSignaturePadState>("penggunaKey");

  // Future<File> saveSignature() async {
  //   final image = await signatureGlobalKey.currentState?.toImage(pixelRatio: 3.0);
  //   final byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
  //   final bytes = byteData?.buffer.asUint8List();
  //
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/signature.png');
  //   await file.writeAsBytes(bytes!);
  //
  //   return file;
  // }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Page reloaded');
    }

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

                _ormawa = usulanKegiatan.ormawa;
                _pembiayaanController = usulanKegiatan.pembiayaan;
                _namaKegiatanController.text = usulanKegiatan.namaKegiatan;
                usulanKegiatan.kategoriBentukKegiatan == "Luring"
                    ? _bentukKegiatanSwitchController = false
                    : _bentukKegiatanSwitchController = true;
                _bentukKegiatanController = usulanKegiatan.bentukKegiatan;
                _deskripsiKegiatanController.text = usulanKegiatan.deskripsiKegiatan;
                _tanggalMulaiController.text = usulanKegiatan.tanggalMulaiKegiatan;
                _tanggalSelesaiController.text = usulanKegiatan.tanggalSelesaiKegiatan;
                _waktuMulaiController.text = usulanKegiatan.waktuMulaiKegiatan;
                _waktuSelesaiController.text = usulanKegiatan.waktuSelesaiKegiatan;
                _tempatKegiatanController.text = usulanKegiatan.tempatKegiatan;
                _tanggalKeberangkatanController.text = usulanKegiatan.tanggalKeberangkatan;
                _tanggalKepulanganController.text = usulanKegiatan.tanggalKepulangan;
                usulanKegiatan.jumlahPartisipan == "Orang"
                    ? _bentukKegiatanSwitchController = false
                    : _bentukKegiatanSwitchController = true;
                _jumlahParsitipanController.text = usulanKegiatan.jumlahPartisipan.toString();
                usulanKegiatan.totalPendanaan == "Uang"
                    ? _bentukKegiatanSwitchController = false
                    : _bentukKegiatanSwitchController = true;
                _targetKegiatanController.text = usulanKegiatan.targetKegiatan;
                _totalPendanaanController.text = usulanKegiatan.totalPendanaan;
                _keteranganController.text = usulanKegiatan.keterangan;
                _ormawaSignatureController = usulanKegiatan.tandaTanganOrmawa;

                _tanggalKeberangkatanController.text.isNotEmpty ?
                _tempatKegiatanSwitchController = true :
                _tempatKegiatanSwitchController = false;

                context.read<TempatKegiatanCubit>().setTempatKegiatan(_tempatKegiatanSwitchController!);

                List<String> ormawaList = usulanKegiatan.mipokaUser.ormawa
                    .map((ormawa) => ormawa.namaOrmawa).toList();

                if (_ormawa?.idOrmawa == 0) {
                  _ormawa = usulanKegiatan.mipokaUser.ormawa[0];
                }

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
                                items: ormawaList,
                                initialItem: _ormawa?.idOrmawa != 0 ? _ormawa?.namaOrmawa : ormawaList[0],
                                onValueChanged: (value) {
                                  int index = ormawaList.indexOf(value!);
                                  // int idOrmawa = idOrmawaList[index];

                                  _ormawa = usulanKegiatan.mipokaUser.ormawa[index];
                                }
                            ),
                            // BlocBuilder<OrmawaBloc, OrmawaState>(
                            //   builder: (context, state) {
                            //     if (state is OrmawaLoading) {
                            //       return const Text("Loading ....");
                            //     } else if (state is AllOrmawaHasData) {
                            //       List<String> ormawaList = state.ormawaList.map(
                            //               (ormawa) => ormawa.namaOrmawa).toList();
                            //
                            //       // List<int> idOrmawaList = state.ormawaList.map(
                            //       //         (ormawa) => ormawa.idOrmawa).toList();
                            //       _ormawa = _ormawa ?? state.ormawaList[0];
                            //
                            //       return MipokaCustomDropdown(
                            //           items: ormawaList,
                            //           onValueChanged: (value) {
                            //             int index = ormawaList.indexOf(value!);
                            //             // int idOrmawa = idOrmawaList[index];
                            //
                            //             _ormawa = state.ormawaList[index];
                            //           }
                            //       );
                            //     } else if (state is OrmawaError) {
                            //       return Text(state.message);
                            //     } else {
                            //       return const Text("OrmawaBloc hasn't been triggered yet.");
                            //     }
                            //   },
                            // ),

                            const CustomFieldSpacer(),

                            buildTitle('Pembiayaan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiPembiayaan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiPembiayaan),

                            MipokaCustomDropdown(
                              items: listPembiayaan,
                              initialItem: _pembiayaanController,
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
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiNamaKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiNamaKegiatan),

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

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiBentukKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiBentukKegiatan),

                            MipokaCustomDropdown(
                              items: listBentukKegiatan,
                              initialItem: _bentukKegiatanController ?? "",
                              onValueChanged: (value) {
                                if (kDebugMode) {
                                  print('Input "$value" to State Management BLoC');
                                }
                                _bentukKegiatanController = value;
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Deskripsi Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiDeskripsiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiDeskripsiKegiatan),
                            CustomTextField(
                                controller: _deskripsiKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Tanggal Mulai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiTanggalMulaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTanggalMulaiKegiatan),

                            CustomDatePickerField(
                                controller: _tanggalMulaiController),

                            const CustomFieldSpacer(),

                            buildTitle('Tanggal Selesai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiTanggalSelesaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTanggalSelesaiKegiatan),
                            CustomDatePickerField(
                                controller: _tanggalSelesaiController),

                            const CustomFieldSpacer(),

                            buildTitle('Waktu Mulai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiWaktuMulaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiWaktuMulaiKegiatan),
                            CustomTimePickerField(
                                controller: _waktuMulaiController),

                            const CustomFieldSpacer(),

                            buildTitle('Waktu Selesai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiWaktuSelesaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiWaktuSelesaiKegiatan),

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

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiTempatKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTempatKegiatan),

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
                                            if (widget.usulanArgs.isRevisiUsulan == true
                                                && usulanKegiatan.revisiUsulan.revisiTanggalKeberangkatan != "")
                                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTanggalKeberangkatan),

                                            CustomDatePickerField(
                                              controller:
                                              _tanggalKeberangkatanController,
                                            ),

                                            const CustomFieldSpacer(),

                                            buildTitle('Tanggal Kepulangan'),
                                            if (widget.usulanArgs.isRevisiUsulan == true
                                                && usulanKegiatan.revisiUsulan.revisiTanggalKepulangan != "")
                                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTanggalKepulangan),
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

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiJumlahPartisipan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiJumlahPartisipan),

                            CustomTextField(
                                controller: _jumlahParsitipanController),
                            const CustomFieldSpacer(),

                            buildTitle('Target Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiTargetKegiatan!= "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTargetKegiatan),
                            CustomTextField(controller: _targetKegiatanController),

                            // const CustomFieldSpacer(),
                            // buildTitle('Total Pendanaan'),

                            MipokaCustomSwitchButton(
                              title: 'Total Pendanaan',
                              option1: 'Uang',
                              option2: 'Dll',
                              value: _totalPendanaanSwitchController,
                              onChanged: (value) {
                                _totalPendanaanSwitchController = value;
                              },
                            ),

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiTotalPendanaan!= "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTotalPendanaan),

                            CustomTextField(
                              controller: _totalPendanaanController,
                              // textInputType: TextInputType.number,
                            ),
                            const CustomFieldSpacer(),

                            buildTitle('Keterangan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiKeterangan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiKeterangan),
                            CustomTextField(controller: _keteranganController),

                            const CustomFieldSpacer(),
                            buildTitle('Tanda Tangan Ormawa'),

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan.revisiTandaTanganOrmawa != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan.revisiTandaTanganOrmawa),

                            BlocProvider<SignatureCubit>(
                              create: (context) => SignatureCubit(),
                              child: BlocBuilder<SignatureCubit, SignatureState>(
                                builder: (context, state) {
                                  return InkWell(
                                    onTap: () => context.read<SignatureCubit>().toggleSignature(),
                                    child: Container(
                                      width: 400,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          _ormawaSignatureController == "" ?
                                          InkWell(
                                            // onTap: () {
                                            // },
                                            onTap: () async {
                                              _ormawaSignatureController = await showSignatureDialog(context);
                                              Future.microtask(() => context.read<SignatureCubit>().toggleSignature());
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
                            ),

                            const CustomFieldSpacer(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                widget.usulanArgs.isRevisiUsulan == false ?
                                CustomMipokaButton(
                                  onTap: () {
                                    context.read<UsulanKegiatanBloc>()
                                        .add(DeleteUsulanKegiatanEvent(idUsulan: widget.usulanArgs.idUsulan));
                                    Navigator.pop(context);
                                  },
                                  text: 'Batal',
                                ) :
                                CustomMipokaButton(
                                  onTap: () => Navigator.pop(context),
                                  text: 'Batal',
                                ),

                                const SizedBox(width: 8.0),

                                CustomMipokaButton(
                                  onTap: () {
                                    mipokaCustomToast('Sedang menyimpan data...', time: 5);

                                    print (_ormawaSignatureController);

                                    Future.microtask(() {
                                      context.read<UsulanKegiatanBloc>().add(
                                        UpdateUsulanKegiatanEvent(
                                          usulanKegiatan: usulanKegiatan.copyWith(
                                            ormawa: _ormawa,
                                            pembiayaan: _pembiayaanController,
                                            namaKegiatan: _namaKegiatanController.text,
                                            kategoriBentukKegiatan: _bentukKegiatanSwitchController == true ? "Luring" : "Daring",
                                            bentukKegiatan: _bentukKegiatanController,
                                            deskripsiKegiatan: _deskripsiKegiatanController.text,
                                            tanggalMulaiKegiatan: _tanggalMulaiController.text,
                                            tanggalSelesaiKegiatan: _tanggalSelesaiController.text,
                                            waktuMulaiKegiatan: _waktuMulaiController.text,
                                            waktuSelesaiKegiatan: _waktuSelesaiController.text,
                                            tempatKegiatan: _tempatKegiatanController.text,
                                            tanggalKeberangkatan: _tempatKegiatanSwitchController == true
                                                ? _tanggalKeberangkatanController.text : "",
                                            tanggalKepulangan: _tempatKegiatanSwitchController == true
                                                ?  _tanggalKepulanganController.text : "",
                                            kategoriJumlahPartisipan: _jumlahParsitipanSwitchController == true ? "Orang" : "Dll",
                                            jumlahPartisipan: _jumlahParsitipanController.text,
                                            targetKegiatan: _targetKegiatanController.text,
                                            kategoriTotalPendanaan: _totalPendanaanSwitchController == true ? "Dll" : "Orang",
                                            totalPendanaan: _totalPendanaanController.text,
                                            tandaTanganOrmawa: _ormawaSignatureController,
                                            updatedAt: currentDate,
                                            updatedBy: user?.email ?? "unknown",
                                          ),
                                        ),
                                      );

                                      // context.read<UsulanKegiatanBloc>().add(
                                      //   ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan));

                                      _tempatKegiatanSwitchController == false ?
                                      Navigator.pushNamed(
                                        context,
                                        penggunaPengajuanUsulanKegiatan2DKPageRoute,
                                        arguments: widget.usulanArgs,
                                      ).then((_) => context.read<UsulanKegiatanBloc>()
                                          .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan))) :
                                      Navigator.pushNamed(
                                        context,
                                        penggunaPengajuanUsulanKegiatan2LKPageRoute,
                                        arguments: widget.usulanArgs,
                                      ).then((_) => context.read<UsulanKegiatanBloc>()
                                          .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan)));
                                    });
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
                return Text('UsulanKegiatanBloc Error : ${state.message}');
              } else {
                if (kDebugMode) {
                  print('UsulanKegiatanBloc has not been triggered');
                }
                return const Center();
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


// TODO: Please Edit this fucking code.
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


// Future<String> showSignatureDialog(BuildContext context) async {
//   final Completer<String> completer = Completer<String>();
//
//   final LabeledGlobalKey<SfSignaturePadState> signatureGlobalKey = LabeledGlobalKey<SfSignaturePadState>("pemeriksaKey");
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
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         contentPadding: const EdgeInsets.all(8.0),
//         content: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Text("Tanda Tangan Pembina"),
//
//               const CustomFieldSpacer(),
//
//               Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.0),
//                   border: Border.all(color: Colors.white),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       width: 300,
//                       height: 200,
//                       child: SfSignaturePad(
//                         key: signatureGlobalKey,
//                         backgroundColor: Colors.white,
//                         strokeColor: Colors.black,
//                         minimumStrokeWidth: 1.0,
//                         maximumStrokeWidth: 4.0,
//                       ),
//                     ),
//
//                     const CustomFieldSpacer(),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             final randomId = Random().nextInt(9999999);
//
//                             mipokaCustomToast(savingDataMessage);
//                             final file = await saveSignature();
//                             final signatureUrl = await uploadFileFromSignature(
//                               file,
//                               "signature_$randomId",
//                             );
//
//                             Future.microtask(() {
//                               completer.complete(signatureUrl);
//                               Navigator.pop(context);
//                             });
//                           },
//                           child: const Text(
//                             'Simpan',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             completer.complete("");
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             'Batal',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
//
//   return completer.future;
// }

Future<String> showSignatureDialog(BuildContext context) async {
  final Completer<String> completer = Completer<String>();

  final GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  // final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  Future<String?> saveSignature() async {
    Uint8List? bytes1;
    String? signatureUrl;
    int randomId = Random().nextInt(99999999);

    final image = await signaturePadKey.currentState?.toImage(pixelRatio: 3.0);
    final byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData?.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/signature.png');
    await file.writeAsBytes(bytes!);

    if (kIsWeb) {
      bytes1 = file.readAsBytesSync();
    } else if (Platform.isAndroid) {
      bytes1 = await File(file.path).readAsBytes();
    }

    if (bytes1 != null) {
      signatureUrl = await uploadBytesToFirebase(bytes1, "signature$randomId.png");
    }

    return signatureUrl;
  }

  // Future<String?> uploadBytesToFirebase(Uint8List bytes, String fileName) async {
  //   try {
  //     final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
  //
  //     final UploadTask uploadTask = storageRef.putData(bytes);
  //     final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //
  //     final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //
  //     return downloadUrl;
  //   } catch (error) {
  //     mipokaCustomToast("Failed while uploading file : $error");
  //     rethrow;
  //   }
  // }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(8.0),
        content: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Tanda Tangan Pembina"),

              const CustomFieldSpacer(),

              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 200,
                      child: SfSignaturePad(
                        key: signaturePadKey,
                        backgroundColor: Colors.white,
                        strokeColor: Colors.black,
                        minimumStrokeWidth: 1.0,
                        maximumStrokeWidth: 4.0,
                      ),
                    ),

                    const CustomFieldSpacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            final randomId = Random().nextInt(9999999);

                            mipokaCustomToast(savingDataMessage);
                            final file = await saveSignature();
                            // final signatureUrl = await uploadFileFromSignature(
                            //   file,
                            //   "signature_$randomId",
                            // );

                            Future.microtask(() {
                              completer.complete(file);
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            'Simpan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            completer.complete("");
                            Navigator.pop(context);
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
              ),
            ],
          ),
        ),
      );
    },
  );

  return completer.future;
}
