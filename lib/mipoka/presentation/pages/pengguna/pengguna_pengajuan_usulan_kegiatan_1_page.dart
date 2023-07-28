import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../../../domain/utils/mobile_image_converter.dart'
if (dart.library.html) '../../../../domain/utils/web_image_converter.dart';

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

  Uint8List? _signatureData;
  final StreamController<Uint8List> _signatureDataStream = StreamController<Uint8List>.broadcast();

  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey<SfSignaturePadState>();

  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return AlertDialog(
              insetPadding: const EdgeInsets.all(12.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Tanda Tangan Ormawa',
                  ),
                  InkWell(
                    //ignore: sdk_version_set_literal
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                      size: 24.0,
                    ),
                  )
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
                    children: <Widget>[
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
                          key: _signaturePadKey,
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
                  onPressed: _handleClearButtonPressed,
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: () {
                    _handleSaveButtonPressed();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  void _handleClearButtonPressed() {
    _signaturePadKey.currentState!.clear();
  }

  Future<void> _handleSaveButtonPressed() async {
    late Uint8List data;

    if (kIsWeb) {
      final RenderSignaturePad renderSignaturePad =
      _signaturePadKey.currentState!.context.findRenderObject()!
      as RenderSignaturePad;
      data = await ImageConverter.toImage(renderSignaturePad: renderSignaturePad);
    } else {
      final ui.Image imageData = await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
      final ByteData? bytes = await imageData.toByteData(format: ui.ImageByteFormat.png);
      if (bytes != null) {
        data = bytes.buffer.asUint8List();
      }
    }

    _signatureData = data;
    _signatureDataStream.add(_signatureData!);
  }

  @override
  void initState() {
    context.read<UsulanKegiatanBloc>().add(
        ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    _signatureDataStream.close();
    _tempatKegiatanSwitchStream.close();
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

  final StreamController<bool> _tempatKegiatanSwitchStream = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Page 1 reloaded');
    }

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
                  BlocConsumer<UsulanKegiatanBloc, UsulanKegiatanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is SaveUsulanKegiatanFirstPageSuccess) {

                        final Object? result;

                        if (_tempatKegiatanSwitchController == false) {
                          result = await Navigator.pushNamed(
                            context,
                            penggunaPengajuanUsulanKegiatan2DKPageRoute,
                            arguments: widget.usulanArgs,
                          );
                        } else {
                          result = await Navigator.pushNamed(
                            context,
                            penggunaPengajuanUsulanKegiatan2LKPageRoute,
                            arguments: widget.usulanArgs,
                          );
                        }

                        if (result != null && result == true && context.mounted) {
                          context.read<UsulanKegiatanBloc>()
                              .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
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
                            ? _totalPendanaanSwitchController = false
                            : _totalPendanaanSwitchController = true;
                        _targetKegiatanController.text = usulanKegiatan.targetKegiatan;
                        _totalPendanaanController.text = usulanKegiatan.totalPendanaan;
                        _keteranganController.text = usulanKegiatan.keterangan;
                        _ormawaSignatureController = usulanKegiatan.tandaTanganOrmawa;

                        _tanggalKeberangkatanController.text.isNotEmpty ?
                        _tempatKegiatanSwitchController = true :
                        _tempatKegiatanSwitchController = false;

                        List<String> ormawaList = usulanKegiatan.mipokaUser.ormawa
                            .map((ormawa) => ormawa.namaOrmawa).toList();

                        _ormawa = usulanKegiatan.ormawa;
                        // usulanKegiatan.mipokaUser.ormawa[0];

                        _bentukKegiatanController ??= listBentukKegiatan[0];
                        if (usulanKegiatan.pembiayaan == "") {
                          _pembiayaanController = listPembiayaan[0];
                        }
                        // _pembiayaanController == "" ? listPembiayaan[0] : _pembiayaanController;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildTitle('Nama Ormawa'),
                            MipokaCustomDropdown(
                              items: ormawaList,
                              initialItem: _ormawa?.namaOrmawa,
                              onValueChanged: (value) {
                                int index = ormawaList.indexOf(value!);
                                // int idOrmawa = idOrmawaList[index];

                                _ormawa = usulanKegiatan.mipokaUser.ormawa[index];
                              },
                            ),

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

                            CustomTextField(controller: _namaKegiatanController),

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

                            NewLineTextField(
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

                            CustomTextField(controller: _tempatKegiatanController),

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
                                controller: _jumlahParsitipanController),
                            const CustomFieldSpacer(),

                            buildTitle('Target Kegiatan'),
                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiTargetKegiatan!= "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTargetKegiatan ?? ""),
                            CustomTextField(controller: _targetKegiatanController),

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
                            buildTitle('Tanda Tangan Ormawa'),

                            if (widget.usulanArgs.isRevisiUsulan == true
                                && usulanKegiatan.revisiUsulan?.revisiTandaTanganOrmawa != "")
                              buildRevisiText(usulanKegiatan.revisiUsulan?.revisiTandaTanganOrmawa ?? ""),

                            BlocProvider<SignatureCubit>(
                              create: (context) => SignatureCubit(),
                              child: BlocBuilder<SignatureCubit, SignatureState>(
                                builder: (context, state) {

                                  return StreamBuilder<Uint8List>(
                                    stream: _signatureDataStream.stream,
                                    initialData: Uint8List(0),
                                    builder: (context, snapshot) {
                                      final signatureData = snapshot.data;

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
                                                onTap: () => _showPopup(),
                                                child: signatureData!.isNotEmpty
                                                    ? Image.memory(signatureData)
                                                    : const Text(
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
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
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
                                    print("1. Ormawa : ${_ormawa != null}");
                                    print("2. Pembaiayaan : ${_pembiayaanController != ""}");
                                    print("3. Nama Kegiatan : ${_namaKegiatanController.text != ""}");
                                    print("4. Bentuk Kegiatan : ${_bentukKegiatanController != null}");
                                    print("5. Deskripsi Kegiatan : ${_deskripsiKegiatanController.text != ""}");
                                    print("6. Tanggal Mulai : ${_tanggalMulaiController.text != ""}");
                                    print("7. Tanggal Selesai : ${_tanggalSelesaiController.text != ""}");
                                    print("8. Waktu Mulai : ${_waktuMulaiController.text != ""}");
                                    print ("9. Waktu Selesai : ${_waktuSelesaiController.text != ""}");
                                    print ("10. Tempat Kegiatan : ${_tempatKegiatanController.text != ""}");
                                    print("11. Jumlah Partisipan : ${_jumlahParsitipanController.text != ""}");
                                    print ("12. Target Kegiatan : ${_targetKegiatanController.text != ""}");
                                    print ("13. Total pendanaan : ${_totalPendanaanController.text != ""}");
                                    print ("14. Keterangan : ${_keteranganController.text != " "}");
                                    print ("15. Ormawa Signature : ${_ormawaSignatureController != "" || _signatureData != null}");

                                    print (_waktuMulaiController.text);

                                    if(
                                    _ormawa != null && _pembiayaanController != ""
                                    && _namaKegiatanController.text != ""
                                    && _bentukKegiatanController != null && _deskripsiKegiatanController.text != ""
                                    && _tanggalMulaiController.text != "" && _tanggalSelesaiController.text != ""
                                    && _waktuMulaiController.text != "" && _waktuSelesaiController.text != ""
                                    && _tempatKegiatanController.text != "" && _jumlahParsitipanController.text != ""
                                    && _targetKegiatanController.text != "" && _totalPendanaanController.text != ""
                                    && _keteranganController.text != "" && (_ormawaSignatureController != "" || _signatureData != null))
                                    {
                                      int uniqueId = UniqueIdGenerator.generateUniqueId();

                                      mipokaCustomToast(savingDataMessage);
                                      if (_ormawaSignatureController == "") {
                                        _ormawaSignatureController = await uploadBytesToFirebase(_signatureData!, "signature$uniqueId.png");
                                      }

                                      _handleClearButtonPressed();

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
                                                  ? _tanggalKeberangkatanController.text : "",
                                              tanggalKepulangan: _tempatKegiatanSwitchController == true
                                                  ?  _tanggalKepulanganController.text : "",
                                              kategoriJumlahPartisipan: _jumlahParsitipanSwitchController == true ? "Orang" : "Dll",
                                              jumlahPartisipan: _jumlahParsitipanController.text,
                                              targetKegiatan: _targetKegiatanController.text,
                                              kategoriTotalPendanaan: _totalPendanaanSwitchController == true ? "Dll" : "Orang",
                                              totalPendanaan: _totalPendanaanController.text,
                                              keterangan: _keteranganController.text,
                                              tandaTanganOrmawa: _ormawaSignatureController,
                                              updatedAt: currentDate,
                                              updatedBy: user?.email ?? "unknown",
                                            ),
                                          ),
                                        );
                                      }


                                    } else {
                                      mipokaCustomToast(emptyFieldMessage);
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
