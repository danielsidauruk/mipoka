import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';

class PenggunaPengajuanUsulanKegiatan3 extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatan3({
    super.key,
    required this.usulanArgs,
  });

  final UsulanArgs usulanArgs;

  @override
  State<PenggunaPengajuanUsulanKegiatan3> createState() =>
      _PenggunaPengajuanUsulanKegiatan3State();
}

class _PenggunaPengajuanUsulanKegiatan3State
    extends State<PenggunaPengajuanUsulanKegiatan3> with RouteAware {

  late QuillController _latarBelakangController;
  late QuillController _tujuanKegiatanController;
  late QuillController _manfaatKegiatanController;
  late QuillController _bentukPelaksanaanKegiatanController;
  late QuillController _targetPencapaianKegiatanController;
  late QuillController _waktuDanTempatPelaksanaanKegiatanController;
  late QuillController _rencanaAnggaranKegiatanController;
  late QuillController _perlengkapanDanPeralatanController;
  late QuillController _penutupController;

  String? _postinganKegiatanController;
  String? _suratUndanganKegiatanController;
  String? _linimasaKegiatanController;
  String? _fotoTempatKegiatanController;

  late StreamController<String?> _postinganKegiatanStream;
  late StreamController<String?> _suratUndanganKegiatanStream;
  late StreamController<String?> _linimasaKegiatanStream;
  late StreamController<String?> _fotoTempatKegiatanStream;

  FilePickerResult? _postinganKegiatanResult;
  FilePickerResult? _suratUndanganKegiatanResult;
  FilePickerResult? _linimasaKegiatanResult;
  FilePickerResult? _fotoTempatKegiatanResult;

  @override
  void initState() {
    _postinganKegiatanStream = StreamController<String?>.broadcast();
    _suratUndanganKegiatanStream = StreamController<String?>.broadcast();
    _linimasaKegiatanStream = StreamController<String?>.broadcast();
    _fotoTempatKegiatanStream = StreamController<String?>.broadcast();

    context.read<UsulanKegiatanBloc>().add(
        ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.usulanArgs.idUsulan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<UsulanKegiatanBloc>().close();
    _postinganKegiatanStream.close();
    _suratUndanganKegiatanStream.close();
    _linimasaKegiatanStream.close();
    _fotoTempatKegiatanStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Page 3 Reloaded');
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
              BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                builder: (context, state) {
                  if (state is UsulanKegiatanLoading) {
                    return const Text('Loading');
                  } else if (state is UsulanKegiatanHasData) {
                    final usulanKegiatan = state.usulanKegiatan;

                    _latarBelakangController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.latarBelakang),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _tujuanKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.tujuanKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _manfaatKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.manfaatKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _bentukPelaksanaanKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.bentukPelaksanaanKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _targetPencapaianKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.targetPencapaianKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _waktuDanTempatPelaksanaanKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.waktuDanTempatPelaksanaan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _rencanaAnggaranKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.rencanaAnggaranKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _perlengkapanDanPeralatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.perlengkapanDanPeralatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _penutupController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.penutup),
                      selection: const TextSelection.collapsed(offset: 0),
                    );

                    _postinganKegiatanController = usulanKegiatan.fotoPostinganKegiatan;
                    if (_postinganKegiatanController != "") {
                      _postinganKegiatanStream.add(_postinganKegiatanController);
                    }
                    _suratUndanganKegiatanController = usulanKegiatan.fotoSuratUndanganKegiatan;
                    if (_suratUndanganKegiatanController != "") {
                      _suratUndanganKegiatanStream.add(_suratUndanganKegiatanController);
                    }
                    _linimasaKegiatanController = usulanKegiatan.fotoLinimasaKegiatan;
                    if (_linimasaKegiatanController != "") {
                      _linimasaKegiatanStream.add(_linimasaKegiatanController);
                    }
                    _fotoTempatKegiatanController = usulanKegiatan.tempatKegiatan;
                    if (_fotoTempatKegiatanController != "") {
                      _fotoTempatKegiatanStream.add(_fotoTempatKegiatanController);
                    }

                    return CustomContentBox(
                      children: [

                        buildTitle('Latar Belakang'),
                        buildDescription('Berisi latar belakang kegiatan diusulkan'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiLatarBelakang != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiLatarBelakang),

                        CustomRichTextField(controller: _latarBelakangController),

                        const CustomFieldSpacer(),

                        buildTitle('Tujuan Kegiatan'),
                        buildDescription('Berisi tujuan kegiatan diusulkan'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiTujuanKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiTujuanKegiatan),
                        CustomRichTextField(controller: _tujuanKegiatanController),

                        const CustomFieldSpacer(),

                        // InkWell(
                        //   onTap: () => Navigator.pushNamed(context, penggunaBerandaPageRoute),
                        //   child: Text("testtt"),
                        // ),

                        buildTitle('Manfaat Kegiatan'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiManfaatKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiManfaatKegiatan),
                        CustomRichTextField(controller: _manfaatKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Bentuk Pelaksanaan Kegiatan'),
                        buildDescription(
                            'Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiBentukPelaksanaanKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiBentukPelaksanaanKegiatan),
                        CustomRichTextField(
                            controller: _bentukPelaksanaanKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Target Pencapaian Kegiatan'),
                        buildDescription(
                            'Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiTargetPencapaianKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiTargetPencapaianKegiatan),
                        CustomRichTextField(
                            controller: _targetPencapaianKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu dan Tempat Pelaksanaan'),
                        buildDescription('Rincikan dengan jelas'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiWaktuDanTempatPelaksanaan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiWaktuDanTempatPelaksanaan),
                        CustomRichTextField(
                            controller: _waktuDanTempatPelaksanaanKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Rencana Anggaran Kegiatan'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiRencanaAnggaranKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiRencanaAnggaranKegiatan),
                        CustomRichTextField(
                            controller: _rencanaAnggaranKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Perlengkapan dan Peralatan (jika ada)'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiManfaatKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiManfaatKegiatan),
                        CustomRichTextField(
                            controller: _perlengkapanDanPeralatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Penutup'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiPenutup != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiPenutup),
                        CustomRichTextField(controller: _penutupController),

                        const CustomFieldSpacer(),

                        buildTitle('Lampiran - Lampiran'),

                        const CustomFieldSpacer(),

                        buildTitle('Postingan Kegiatan'),
                        buildDescription(
                            'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiFotoPostinganKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiFotoPostinganKegiatan),
                        StreamBuilder<String?>(
                          initialData: _postinganKegiatanController,
                          stream: _postinganKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _postinganKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                PlatformFile? file = _postinganKegiatanResult?.files.first;
                                if (_postinganKegiatanResult != null) {
                                  if (file?.extension!.toLowerCase() == 'jpg' ||
                                      file?.extension!.toLowerCase() == 'jpeg' ||
                                      file?.extension!.toLowerCase() == 'png' ||
                                      file?.extension!.toLowerCase() == 'gif'){
                                    _postinganKegiatanStream.add(_postinganKegiatanResult?.files.first.name);
                                  } else {
                                    mipokaCustomToast("Tipe data file bukan gambar.");
                                  }
                                }
                              },
                              onDelete: () {
                                deleteFileFromFirebase(_postinganKegiatanController ?? "");
                                _postinganKegiatanStream.add("");
                                _postinganKegiatanController = "";
                                _postinganKegiatanResult = null;
                              },
                              text: text,
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Surat Undangan Kegiatan'),
                        buildDescription(
                            'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiFotoSuratUndanganKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiFotoSuratUndanganKegiatan),
                        StreamBuilder<String?>(
                          initialData: _suratUndanganKegiatanController,
                          stream: _suratUndanganKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _suratUndanganKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                PlatformFile? file = _suratUndanganKegiatanResult?.files.first;
                                if (_suratUndanganKegiatanResult!= null) {
                                  if (file?.extension!.toLowerCase() == 'jpg' ||
                                      file?.extension!.toLowerCase() == 'jpeg' ||
                                      file?.extension!.toLowerCase() == 'png' ||
                                      file?.extension!.toLowerCase() == 'gif'){
                                    _suratUndanganKegiatanStream.add(_suratUndanganKegiatanResult?.files.first.name);
                                  } else {
                                    mipokaCustomToast("Tipe data file bukan gambar.");
                                  }
                                }
                              },
                              onDelete: () {
                                deleteFileFromFirebase(_suratUndanganKegiatanController ?? "");
                                _suratUndanganKegiatanStream.add("");
                                _suratUndanganKegiatanController = "";
                                _suratUndanganKegiatanResult = null;
                              },
                              text: text,
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Linimasa Kegiatan'),
                        buildDescription(
                            'Unggah foto linimasa kegiatan yang akan dilaksanakan.'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiFotoLinimasaKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiFotoLinimasaKegiatan),
                        StreamBuilder<String?>(
                          initialData: _linimasaKegiatanController,
                          stream: _linimasaKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _linimasaKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                PlatformFile? file = _linimasaKegiatanResult?.files.first;
                                if (_linimasaKegiatanResult!= null) {
                                  if (file?.extension!.toLowerCase() == 'jpg' ||
                                      file?.extension!.toLowerCase() == 'jpeg' ||
                                      file?.extension!.toLowerCase() == 'png' ||
                                      file?.extension!.toLowerCase() == 'gif'){
                                    _linimasaKegiatanStream.add(_linimasaKegiatanResult?.files.first.name);
                                  } else {
                                    mipokaCustomToast("Tipe data file bukan gambar.");
                                  }
                                }
                              },
                              onDelete: () {
                                deleteFileFromFirebase(_linimasaKegiatanController ?? "");
                                _linimasaKegiatanStream.add("");
                                _linimasaKegiatanController = "";
                                _linimasaKegiatanResult = null;
                              },
                              text: text,
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Tempat Kegiatan'),
                        buildDescription(
                            'Unggah foto tempat kegiatan yang akan dilaksanakan.'),
                        if (widget.usulanArgs.isRevisiUsulan == true
                            && state.usulanKegiatan.revisiUsulan.revisiFotoTempatKegiatan != "")
                          buildRevisiText(state.usulanKegiatan.revisiUsulan.revisiFotoTempatKegiatan),
                        StreamBuilder<String?>(
                          initialData: _fotoTempatKegiatanController,
                          stream: _fotoTempatKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _fotoTempatKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                PlatformFile? file = _fotoTempatKegiatanResult?.files.first;
                                if (_fotoTempatKegiatanResult!= null) {
                                  if (file?.extension!.toLowerCase() == 'jpg' ||
                                      file?.extension!.toLowerCase() == 'jpeg' ||
                                      file?.extension!.toLowerCase() == 'png' ||
                                      file?.extension!.toLowerCase() == 'gif'){
                                    _fotoTempatKegiatanStream.add(_fotoTempatKegiatanResult?.files.first.name);
                                  } else {
                                    mipokaCustomToast("Tipe data file bukan gambar.");
                                  }
                                }
                              },
                              onDelete: (){
                                deleteFileFromFirebase(_fotoTempatKegiatanController ?? "");
                                _fotoTempatKegiatanStream.add("");
                                _fotoTempatKegiatanController = "";
                                _fotoTempatKegiatanResult = null;
                              },
                              text: text,
                            );
                          },
                        ),

                        const CustomFieldSpacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () async {
                                if (_latarBelakangController.document.toPlainText() != "" && _tujuanKegiatanController.document.toPlainText() != ""
                                    && _manfaatKegiatanController.document.toPlainText() != "" && _bentukPelaksanaanKegiatanController.document.toPlainText() != ""
                                    && _targetPencapaianKegiatanController.document.toPlainText() != "" && _waktuDanTempatPelaksanaanKegiatanController.document.toPlainText() != ""
                                    && _rencanaAnggaranKegiatanController.document.toPlainText() != "" && _perlengkapanDanPeralatanController.document.toPlainText() != ""
                                    && _penutupController.document.toPlainText() != "") {

                                  mipokaCustomToast('Sedang menyimpan data...', time: 5);

                                  final postinganKegiatanResult = _postinganKegiatanResult;
                                  if (postinganKegiatanResult != null) {
                                    PlatformFile file = postinganKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _postinganKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  final suratUndanganKegiatanResult = _suratUndanganKegiatanResult;
                                  if (suratUndanganKegiatanResult != null) {
                                    PlatformFile file = suratUndanganKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _suratUndanganKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  final linimasaKegiatanResult = _linimasaKegiatanResult;
                                  if (linimasaKegiatanResult != null) {
                                    PlatformFile file = linimasaKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _linimasaKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  final fotoTempatKegiatanResult = _fotoTempatKegiatanResult;
                                  if (fotoTempatKegiatanResult != null) {
                                    PlatformFile file = fotoTempatKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _fotoTempatKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  Future.microtask(() {
                                    context.read<UsulanKegiatanBloc>().add(
                                      UpdateUsulanKegiatanEvent(
                                        usulanKegiatan: usulanKegiatan.copyWith(
                                          latarBelakang: _latarBelakangController.document.toPlainText(),
                                          tujuanKegiatan: _tujuanKegiatanController.document.toPlainText(),
                                          manfaatKegiatan: _manfaatKegiatanController.document.toPlainText(),
                                          bentukKegiatan: _bentukPelaksanaanKegiatanController.document.toPlainText(),
                                          targetKegiatan: _targetPencapaianKegiatanController.document.toPlainText(),
                                          waktuDanTempatPelaksanaan: _waktuDanTempatPelaksanaanKegiatanController.document.toPlainText(),
                                          rencanaAnggaranKegiatan: _rencanaAnggaranKegiatanController.document.toPlainText(),
                                          perlengkapanDanPeralatan: _perlengkapanDanPeralatanController.document.toPlainText(),
                                          penutup: _penutupController.document.toPlainText(),
                                          fotoPostinganKegiatan: _postinganKegiatanController,
                                          fotoSuratUndanganKegiatan: _suratUndanganKegiatanController,
                                          fotoLinimasaKegiatan: _linimasaKegiatanController,
                                          fotoTempatKegiatan: _fotoTempatKegiatanController,
                                          updatedAt: currentDate,
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  });
                                } else {
                                  mipokaCustomToast(emptyFieldMessage);
                                }
                              },
                              text: 'Sebelumnya',
                            ),

                            const SizedBox(width: 8.0),

                            CustomMipokaButton(
                              onTap: () async {
                                if (_latarBelakangController.document.toPlainText() != "" && _tujuanKegiatanController.document.toPlainText() != ""
                                    && _manfaatKegiatanController.document.toPlainText() != "" && _bentukPelaksanaanKegiatanController.document.toPlainText() != ""
                                    && _targetPencapaianKegiatanController.document.toPlainText() != "" && _waktuDanTempatPelaksanaanKegiatanController.document.toPlainText() != ""
                                    && _rencanaAnggaranKegiatanController.document.toPlainText() != "" && _perlengkapanDanPeralatanController.document.toPlainText() != ""
                                    && _penutupController.document.toPlainText() != "") {

                                  mipokaCustomToast("Sedang menyimpan data ...", time: 5);

                                  final postinganKegiatanResult = _postinganKegiatanResult;
                                  if (postinganKegiatanResult != null) {
                                    PlatformFile file = postinganKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _postinganKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  final suratUndanganKegiatanResult = _suratUndanganKegiatanResult;
                                  if (suratUndanganKegiatanResult != null) {
                                    PlatformFile file = suratUndanganKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _suratUndanganKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  final linimasaKegiatanResult = _linimasaKegiatanResult;
                                  if (linimasaKegiatanResult != null) {
                                    PlatformFile file = linimasaKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _linimasaKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  final fotoTempatKegiatanResult = _fotoTempatKegiatanResult;
                                  if (fotoTempatKegiatanResult != null) {
                                    PlatformFile file = fotoTempatKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _fotoTempatKegiatanController = await uploadBytesToFirebase(bytes, "${usulanKegiatan.idUsulan}${file.name}");
                                    }
                                  }

                                  Future.microtask(() {
                                    context.read<UsulanKegiatanBloc>().add(
                                      UpdateUsulanKegiatanEvent(
                                        usulanKegiatan: usulanKegiatan.copyWith(
                                          latarBelakang: _latarBelakangController.document.toPlainText(),
                                          tujuanKegiatan: _tujuanKegiatanController.document.toPlainText(),
                                          manfaatKegiatan: _manfaatKegiatanController.document.toPlainText(),
                                          bentukKegiatan: _bentukPelaksanaanKegiatanController.document.toPlainText(),
                                          targetKegiatan: _targetPencapaianKegiatanController.document.toPlainText(),
                                          waktuDanTempatPelaksanaan: _waktuDanTempatPelaksanaanKegiatanController.document.toPlainText(),
                                          rencanaAnggaranKegiatan: _rencanaAnggaranKegiatanController.document.toPlainText(),
                                          perlengkapanDanPeralatan: _perlengkapanDanPeralatanController.document.toPlainText(),
                                          penutup: _penutupController.document.toPlainText(),
                                          fotoPostinganKegiatan: _postinganKegiatanController,
                                          fotoSuratUndanganKegiatan: _suratUndanganKegiatanController,
                                          fotoLinimasaKegiatan: _linimasaKegiatanController,
                                          fotoTempatKegiatan: _fotoTempatKegiatanController,
                                          updatedAt: currentDate,
                                        ),
                                      ),
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      penggunaDaftarPengajuanKegiatanPageRoute,
                                    );
                                    context.read<UsulanKegiatanBloc>().add(const ReadAllUsulanKegiatanEvent());
                                    mipokaCustomToast("Usulan Kegiatan telah dikirim");
                                  });
                                } else {
                                  mipokaCustomToast(emptyFieldMessage);
                                }
                              },
                              text: widget.usulanArgs.isRevisiUsulan == true ? 'Kirim Revisi' : 'Kirim',
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is UsulanKegiatanError) {
                    return Text(state.message);
                  } else {
                    return const Center();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SuratUndanganCubit extends Cubit<String?> {
  SuratUndanganCubit() : super('');

  void setSuratUndangan(String? url) {
    emit(url);
  }
}
