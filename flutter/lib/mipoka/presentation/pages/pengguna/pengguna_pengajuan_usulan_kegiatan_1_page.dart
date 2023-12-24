import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'dart:ui' as ui;
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/signature_cubit.dart';
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

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(
        ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    _tempatKegiatanSwitchStream.close();
    super.dispose();
  }

  Ormawa? _ormawa;
  String? _pembiayaanController;
  final TextEditingController _namaKegiatanController = TextEditingController();
  String? _bentukKegiatanController;
  bool? _bentukKegiatanSwitchController;
  final TextEditingController _deskripsiKegiatanController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();
  final TextEditingController _tanggalKeberangkatanController = TextEditingController();
  final TextEditingController _tanggalKepulanganController = TextEditingController();
  bool? _tempatKegiatanSwitchController;
  final TextEditingController _tempatKegiatanController = TextEditingController();
  final TextEditingController _targetKegiatanController = TextEditingController();
  bool? _jumlahParsitipanSwitchController;
  final TextEditingController _jumlahParsitipanController = TextEditingController();
  bool? _totalPendanaanSwitchController;
  final TextEditingController _totalPendanaanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  String? _ormawaSignatureController;

  final StreamController<bool> _tempatKegiatanSwitchStream = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Page 1 reloaded');
    }

    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<UsulanKegiatanBloc>().add(
              ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
        },
      ),

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
                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is SaveUsulanKegiatanFirstPageSuccess) {

                        final Object? result;

                        if (_tempatKegiatanSwitchController == false) {
                          Navigator.pushNamed(
                            context,
                            penggunaPengajuanUsulanKegiatan2DKPageRoute,
                            arguments: widget.usulanArgs,
                          ).then((_) => context.read<UsulanKegiatanBloc>()
                              .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan)));
                        } else {
                          Navigator.pushNamed(
                            context,
                            penggunaPengajuanUsulanKegiatan2LKPageRoute,
                            arguments: widget.usulanArgs,
                          ).then((_) => context.read<UsulanKegiatanBloc>()
                              .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan)));
                        }

                      } else if (state is UsulanKegiatanDeleted) {

                        Navigator.pop(context, true);
                      }
                      else if (state is UsulanKegiatanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is UsulanKegiatanLoading) {
                        return const Text('Loading');
                      } else if (state is UsulanKegiatanHasData) {
                        final usulanKegiatan = state.usulanKegiatan;

                        _ormawa = usulanKegiatan.ormawa;
                        _pembiayaanController = usulanKegiatan.pembiayaan;
                        _namaKegiatanController.text = usulanKegiatan.namaKegiatan;
                        usulanKegiatan.kategoriBentukKegiatan == "Daring"
                            ? _bentukKegiatanSwitchController = true
                            : _bentukKegiatanSwitchController = false;
                        _bentukKegiatanController = usulanKegiatan.bentukKegiatan;
                        _deskripsiKegiatanController.text = usulanKegiatan.deskripsiKegiatan;
                        _tanggalMulaiController.text = usulanKegiatan.tanggalMulaiKegiatan;
                        _tanggalSelesaiController.text = usulanKegiatan.tanggalSelesaiKegiatan;
                        _waktuMulaiController.text = usulanKegiatan.waktuMulaiKegiatan;
                        _waktuSelesaiController.text = usulanKegiatan.waktuSelesaiKegiatan;
                        _tempatKegiatanController.text = usulanKegiatan.tempatKegiatan;

                        (_tanggalKeberangkatanController.text == "-" || _tanggalKeberangkatanController.text == "")
                            || (_tanggalKepulanganController.text == "-" || _tanggalKepulanganController.text == "") ?
                        _tempatKegiatanSwitchController = false :
                        _tempatKegiatanSwitchController = true;


                        _tanggalKeberangkatanController.text = usulanKegiatan.tanggalKeberangkatan;
                        _tanggalKepulanganController.text = usulanKegiatan.tanggalKepulangan;
                        usulanKegiatan.jumlahPartisipan == "Orang"
                            ? _bentukKegiatanSwitchController = true
                            : _bentukKegiatanSwitchController = false;
                        _jumlahParsitipanController.text = usulanKegiatan.jumlahPartisipan;
                        _targetKegiatanController.text = usulanKegiatan.targetKegiatan;

                        _totalPendanaanController.text = usulanKegiatan.totalPendanaan;
                        usulanKegiatan.kategoriTotalPendanaan == "Dll"
                            ? _totalPendanaanSwitchController = true
                            : _totalPendanaanSwitchController = false;

                        print (usulanKegiatan.totalPendanaan);

                        _keteranganController.text = usulanKegiatan.keterangan;

                        List<String> ormawaList = usulanKegiatan.mipokaUser.ormawa
                            .map((ormawa) => ormawa.namaOrmawa).toList();

                        _ormawa = usulanKegiatan.ormawa;

                        if (_bentukKegiatanController == null || _bentukKegiatanController == "") {
                          _bentukKegiatanController = listBentukKegiatan[0];
                        }
                        if (usulanKegiatan.pembiayaan == "") {
                          _pembiayaanController = listPembiayaan[0];
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildTitle('Nama Ormawa'),

                            usulanKegiatan.mipokaUser.ormawa.isNotEmpty ?
                            MipokaCustomDropdown(
                              items: ormawaList,
                              initialItem: _ormawa?.namaOrmawa,
                              onValueChanged: (value) {
                                int index = ormawaList.indexOf(value!);

                                _ormawa = usulanKegiatan.mipokaUser.ormawa[index];
                              },
                            ) :
                            const Center(),

                            const CustomFieldSpacer(),

                            buildTitle('Pembiayaan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiPembiayaan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiPembiayaan ?? ""),

                            MipokaCustomDropdown(
                              items: listPembiayaan,
                              initialItem: _pembiayaanController,
                              onValueChanged: (value) {
                                _pembiayaanController = value ?? "";
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Nama Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiNamaKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiNamaKegiatan ?? ""),

                            CustomTextField(
                              controller: _namaKegiatanController,
                            ),

                            MipokaCustomSwitchButton(
                              title: 'Bentuk Kegiatan',
                              option1: 'Daring',
                              option2: 'Luring',
                              value: _bentukKegiatanSwitchController,
                              onChanged: (value) {
                                _bentukKegiatanSwitchController = value;
                              },
                            ),

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiBentukKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiBentukKegiatan ?? ""),

                            MipokaCustomDropdown(
                              items: listBentukKegiatan,
                              initialItem: _bentukKegiatanController,
                              onValueChanged: (value) {
                                _bentukKegiatanController = value;
                              },
                            ),

                            const CustomFieldSpacer(),

                            buildTitle('Deskripsi Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiDeskripsiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiDeskripsiKegiatan ?? ""),

                            MultiLineTextField(
                                controller: _deskripsiKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Tanggal Mulai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiTanggalMulaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTanggalMulaiKegiatan ?? ""),

                            CustomDatePickerField(
                                controller: _tanggalMulaiController),

                            const CustomFieldSpacer(),

                            buildTitle('Tanggal Selesai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiTanggalSelesaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTanggalSelesaiKegiatan ?? ""),
                            CustomDatePickerField(
                                controller: _tanggalSelesaiController),

                            const CustomFieldSpacer(),

                            buildTitle('Waktu Mulai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiWaktuMulaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiWaktuMulaiKegiatan ?? ""),
                            CustomTimePickerField(
                                controller: _waktuMulaiController),

                            const CustomFieldSpacer(),

                            buildTitle('Waktu Selesai Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiWaktuSelesaiKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiWaktuSelesaiKegiatan ?? ""),

                            CustomTimePickerField(
                                controller: _waktuSelesaiController),

                            MipokaCustomSwitchButton(
                              title: 'Tempat Kegiatan',
                              option1: 'Dalam Kota',
                              option2: 'Luar Kota',
                              value: _tempatKegiatanSwitchController,
                              onChanged: (value) {
                                _tempatKegiatanSwitchController = value;
                                _tempatKegiatanSwitchStream.add(value);
                              },
                            ),

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiTempatKegiatan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTempatKegiatan ?? ""),

                            CustomTextField(
                              controller: _tempatKegiatanController,
                              textFieldWidth: 800,
                            ),

                            const CustomFieldSpacer(),

                            StreamBuilder<bool>(
                              initialData: _tempatKegiatanSwitchController,
                              stream: _tempatKegiatanSwitchStream.stream,
                              builder: (context, snapshot) {
                                bool? isLuarKota = snapshot.data;
                                return isLuarKota == true ?

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildTitle('Tanggal Keberangkatan'),
                                    if (widget.usulanArgs.isRevisiUsulan == true
                                        && usulanKegiatan.revisiUsulan?.revisiTanggalKeberangkatan != "")
                                      buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTanggalKeberangkatan ?? ""),

                                    CustomDatePickerField(
                                      controller:
                                      _tanggalKeberangkatanController,
                                    ),

                                    const CustomFieldSpacer(),

                                    buildTitle('Tanggal Kepulangan'),
                                    if (widget.usulanArgs.isRevisiUsulan == true
                                        && usulanKegiatan.revisiUsulan?.revisiTanggalKepulangan != "")
                                      buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTanggalKepulangan ?? ""),
                                    CustomDatePickerField(
                                      controller: _tanggalKepulanganController,
                                    ),
                                  ],
                                ) :

                                const SizedBox();
                              },
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
                                && usulanKegiatan.revisiUsulan?.revisiJumlahPartisipan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiJumlahPartisipan ?? ""),

                            CustomTextField(
                              controller: _jumlahParsitipanController,
                              textFieldWidth: 800,
                            ),
                            const CustomFieldSpacer(),

                            buildTitle('Target Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiTargetKegiatan!= "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTargetKegiatan ?? ""),

                            CustomTextField(
                              controller: _targetKegiatanController,

                            ),

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
                                && usulanKegiatan.revisiUsulan?.revisiTotalPendanaan!= "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTotalPendanaan ?? ""),

                            CustomTextField(controller: _totalPendanaanController),
                            const CustomFieldSpacer(),

                            buildTitle('Keterangan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiKeterangan != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiKeterangan ?? ""),
                            CustomTextField(controller: _keteranganController),

                            const CustomFieldSpacer(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                widget.usulanArgs.isRevisiUsulan == false ?
                                CustomMipokaButton(
                                  onTap: () => context.read<UsulanKegiatanBloc>()
                                      .add(DeleteUsulanKegiatanEvent(idUsulan: widget.usulanArgs.idUsulan)),
                                  text: 'Batal',
                                ) :
                                CustomMipokaButton(
                                  onTap: () => Navigator.pop(context),
                                  text: 'Batal',
                                ),

                                const SizedBox(width: 8.0),

                                CustomMipokaButton(
                                  onTap: () async {
                              
                                    if (_ormawa == null) {
                                      mipokaCustomToast(emptyFieldPrompt("Ormawa"));
                                    } else if (_pembiayaanController == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Pembiayaan"));
                                    } else if (_namaKegiatanController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Nama Kegiatan"));
                                    } else if (_bentukKegiatanController == null) {
                                      mipokaCustomToast(emptyFieldPrompt("Bentuk Kegiatan"));
                                    } else if (_deskripsiKegiatanController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Deskripsi Kegiatan"));
                                    } else if (_tanggalMulaiController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Tanggal Mulai Kegiatan"));
                                    } else if (_tanggalSelesaiController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Tanggal Selesai Kegiatan"));
                                    } else if (_waktuMulaiController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Waktu Mulai Kegiatan"));
                                    } else if (_waktuSelesaiController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Waktu Selesai Kegiatan"));
                                    } else if (_tempatKegiatanController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Tempat Kegiatan"));
                                    } else if (_jumlahParsitipanController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Jumlah Partisipan"));
                                    } else if (_targetKegiatanController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Target Kegiatan"));
                                    } else if (_totalPendanaanController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Total Pendanaan"));
                                    } else if (_totalPendanaanSwitchController == false
                                        && int.tryParse(_totalPendanaanController.text) == null) {
                                      mipokaCustomToast(dataTypeFalsePrompt("Total Pendanaan"));
                                    } else if (_keteranganController.text == "") {
                                      mipokaCustomToast(emptyFieldPrompt("Keterangan"));
                                    }
                                    else if (int.tryParse(_jumlahParsitipanController.text) == null) {
                                      mipokaCustomToast(dataTypeFalsePrompt("Jumlah Partisipan"));
                                    } else if (_tempatKegiatanSwitchController == true
                                        && (_tanggalKeberangkatanController.text == "-" || _tanggalKeberangkatanController.text == "")) {
                                      mipokaCustomToast(emptyFieldPrompt("Tanggal Keberangakatan"));
                                    } else if (_tempatKegiatanSwitchController == true
                                        && (_tanggalKepulanganController.text == "-" || _tanggalKepulanganController.text == "")) {
                                      mipokaCustomToast(emptyFieldPrompt("Tanggal Kepulangan"));
                                    } else {
                                      mipokaCustomToast(savingDataMessage);

                                      if(_tempatKegiatanSwitchController == false) {
                                        _tanggalKeberangkatanController.text = "-";
                                        _tanggalKepulanganController.text = "-";
                                      }

                                      String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                                      print(_totalPendanaanSwitchController);

                                      if (context.mounted) {
                                        context.read<UsulanKegiatanBloc>().add(
                                          SaveUsulanKegiatanFirstPageEvent(
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
                                                  ? _tanggalKeberangkatanController.text : "-",
                                              tanggalKepulangan: _tempatKegiatanSwitchController == true
                                                  ?  _tanggalKepulanganController.text : "-",
                                              kategoriJumlahPartisipan: _jumlahParsitipanSwitchController == true ? "Orang" : "Tim",
                                              jumlahPartisipan: _jumlahParsitipanController.text,
                                              targetKegiatan: _targetKegiatanController.text,
                                              kategoriTotalPendanaan: _totalPendanaanSwitchController == false ? "Uang" : "Dll",
                                              totalPendanaan: _totalPendanaanController.text,
                                              keterangan: _keteranganController.text,
                                              updatedAt: currentDate,
                                              updatedBy: user?.email ?? "unknown",
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  text: 'Berikutnya',
                                ),
                              ],
                            ),
                          ],
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
