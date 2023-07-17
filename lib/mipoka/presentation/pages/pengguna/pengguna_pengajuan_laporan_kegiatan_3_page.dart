import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/multiple_args.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
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

class PenggunaPengajuanLaporanKegiatan3 extends StatefulWidget {
  const PenggunaPengajuanLaporanKegiatan3({
    required this.laporanArgs,
    super.key,
  });

  final LaporanArgs laporanArgs;

  @override
  State<PenggunaPengajuanLaporanKegiatan3> createState() =>
      _PenggunaPengajuanLaporanKegiatan3State();
}

class _PenggunaPengajuanLaporanKegiatan3State
    extends State<PenggunaPengajuanLaporanKegiatan3> {
  
  @override
  void initState() {
    context.read<LaporanBloc>().add(ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    super.dispose();
  }

  late QuillController _latarBelakangController;
  late QuillController _hasilKegiatanController;
  late QuillController _penutupController;

  String? _postinganKegiatanController;
  String? _dokumentasiKegiatanController;
  String? _tabulasiHasilKegiatanController;
  String? _fakturPembayaranController;

  FilePickerResult? _postinganKegiatanResult;
  FilePickerResult? _dokumentasiKegiatanResult;
  FilePickerResult? _tabulasiHasilKegiatanResult;
  FilePickerResult? _fakturPembayaranResult;


  final StreamController<String?> _postinganKegiatanStream = StreamController<String?>.broadcast();
  final StreamController<String?> _dokumentasiKegiatanStream = StreamController<String?>.broadcast();
  final StreamController<String?> _tabulasiHasilKegiatanStream = StreamController<String?>.broadcast();
  final StreamController<String?> _fakturPembayaranStream = StreamController<String?>.broadcast();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: BlocBuilder<LaporanBloc, LaporanState>(
          builder: (context, state) {
            if (state is LaporanLoading){
              return const Text('Loading ...');
            } else if (state is LaporanHasData) {
              final laporan = state.laporan;

              _latarBelakangController = QuillController(
                document: Document()..insert(0, laporan.latarBelakang),
                selection: const TextSelection.collapsed(offset: 0),
              );
              _hasilKegiatanController = QuillController(
                document: Document()..insert(0, laporan.hasilKegiatan),
                selection: const TextSelection.collapsed(offset: 0),
              );
              _penutupController = QuillController(
                document: Document()..insert(0, laporan.penutup),
                selection: const TextSelection.collapsed(offset: 0),
              );

              List<String> fotoDokumentasiKegiatanList = laporan.fotoDokumentasiKegiatan;

              _postinganKegiatanController = laporan.fotoPostinganKegiatan;
              _tabulasiHasilKegiatanController = laporan.fotoTabulasiHasil;
              _fakturPembayaranController = laporan.fotoFakturPembayaran;
              _dokumentasiKegiatanController = laporan.fotoDokumentasiKegiatan[0];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomMobileTitle(
                        text: 'Pengajuan - Kegiatan - Laporan Kegiatan'),
                    const CustomFieldSpacer(),
                    CustomContentBox(
                      children: [
                        buildTitle('Latar Belakang'),
                        buildDescription('Berisi latar belakang kegiatan diusulkan'),
                        if (widget.laporanArgs.isRevisiLaporan == true
                            && laporan.revisiLaporan.revisiLatarBelakang != "")
                          buildRevisiText(laporan.revisiLaporan.revisiLatarBelakang),
                        CustomRichTextField(controller: _latarBelakangController),

                        const CustomFieldSpacer(),

                        buildTitle('Hasil Kegiatan'),
                        buildDescription('Berisi hasil kegiatan yang telah selesai'),
                        if (widget.laporanArgs.isRevisiLaporan == true
                            && laporan.revisiLaporan.revisiHasilKegiatan != "")
                          buildRevisiText(laporan.revisiLaporan.revisiHasilKegiatan),
                        CustomRichTextField(controller: _hasilKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Penutup'),
                        buildDescription('Ucapkan salam penutup.'),
                        if (widget.laporanArgs.isRevisiLaporan == true
                            && laporan.revisiLaporan.revisiPenutup != "")
                          buildRevisiText(laporan.revisiLaporan.revisiPenutup),
                        CustomRichTextField(controller: _penutupController),

                        const CustomFieldSpacer(),

                        buildTitle('Lampiran'),

                        buildTitle('Postingan Kegiatan'),
                        buildDescription(
                            'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                        if (widget.laporanArgs.isRevisiLaporan == true
                            && laporan.revisiLaporan.revisiFotoPostinganKegiatan != "")
                          buildRevisiText(laporan.revisiLaporan.revisiFotoPostinganKegiatan),
                        StreamBuilder<String?>(
                          initialData: _postinganKegiatanController,
                          stream: _postinganKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _postinganKegiatanResult = await FilePicker.platform.pickFiles();
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
                        buildTitle('Dokumentasi Kegiatan'),
                        buildDescription(
                            'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                        if (widget.laporanArgs.isRevisiLaporan == true
                            && laporan.revisiLaporan.revisiFotoDokumentasiKegiatan != "")
                          buildRevisiText(laporan.revisiLaporan.revisiFotoDokumentasiKegiatan),
                        StreamBuilder<String?>(
                          initialData: _dokumentasiKegiatanController,
                          stream: _dokumentasiKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _dokumentasiKegiatanResult = await FilePicker.platform.pickFiles();
                                PlatformFile? file = _dokumentasiKegiatanResult?.files.first;
                                if (_dokumentasiKegiatanResult != null) {
                                  if (file?.extension!.toLowerCase() == 'jpg' ||
                                      file?.extension!.toLowerCase() == 'jpeg' ||
                                      file?.extension!.toLowerCase() == 'png' ||
                                      file?.extension!.toLowerCase() == 'gif'){
                                    _dokumentasiKegiatanStream.add(_dokumentasiKegiatanResult?.files.first.name);
                                  } else {
                                    mipokaCustomToast("Tipe data file bukan gambar.");
                                  }
                                }
                              },
                              onDelete: () {
                                deleteFileFromFirebase(_dokumentasiKegiatanController ?? "");
                                _dokumentasiKegiatanStream.add("");
                                _dokumentasiKegiatanController = "";
                                _dokumentasiKegiatanResult = null;
                              },
                              text: text,
                            );
                          },
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Tabulasi Hasil'),
                        buildDescription(
                            'Unggah foto pencapaian dari kegiatan yang telah dilaksanakan.'),
                        if (widget.laporanArgs.isRevisiLaporan == true
                            && laporan.revisiLaporan.revisiFotoTabulasiHasil != "")
                          buildRevisiText(laporan.revisiLaporan.revisiFotoTabulasiHasil),
                        StreamBuilder<String?>(
                          initialData: _tabulasiHasilKegiatanController,
                          stream: _tabulasiHasilKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _tabulasiHasilKegiatanResult = await FilePicker.platform.pickFiles();
                                PlatformFile? file = _tabulasiHasilKegiatanResult?.files.first;
                                if (_tabulasiHasilKegiatanResult != null) {
                                  if (file?.extension!.toLowerCase() == 'jpg' ||
                                      file?.extension!.toLowerCase() == 'jpeg' ||
                                      file?.extension!.toLowerCase() == 'png' ||
                                      file?.extension!.toLowerCase() == 'gif'){
                                    _tabulasiHasilKegiatanStream.add(_tabulasiHasilKegiatanResult?.files.first.name);
                                  } else {
                                    mipokaCustomToast("Tipe data file bukan gambar.");
                                  }
                                }
                              },
                              onDelete: () {
                                deleteFileFromFirebase(_tabulasiHasilKegiatanController ?? "");
                                _tabulasiHasilKegiatanStream.add("");
                                _tabulasiHasilKegiatanController = "";
                                _tabulasiHasilKegiatanResult = null;
                              },
                              text: text,
                            );
                          },
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Faktur Pembayaran'),
                        buildDescription(
                            'Unggah bon transaksi kegiatan yang telah dilaksanakan.'),
                        if (widget.laporanArgs.isRevisiLaporan == true
                            && laporan.revisiLaporan.revisiFotoFakturPembayaran != "")
                          buildRevisiText(laporan.revisiLaporan.revisiFotoFakturPembayaran),
                        StreamBuilder<String?>(
                          initialData: _fakturPembayaranController,
                          stream: _fakturPembayaranStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return MipokaFileUploader(
                              asset: "assets/icons/attach.png",
                              onTap: () async {
                                _fakturPembayaranResult = await FilePicker.platform.pickFiles();
                                PlatformFile? file = _fakturPembayaranResult?.files.first;
                                if (_fakturPembayaranResult != null) {
                                  if (file?.extension!.toLowerCase() == 'jpg' ||
                                      file?.extension!.toLowerCase() == 'jpeg' ||
                                      file?.extension!.toLowerCase() == 'png' ||
                                      file?.extension!.toLowerCase() == 'gif'){
                                    _fakturPembayaranStream.add(_fakturPembayaranResult?.files.first.name);
                                  } else {
                                    mipokaCustomToast("Tipe data file bukan gambar.");
                                  }
                                }
                              },
                              onDelete: () {
                                deleteFileFromFirebase(_fakturPembayaranController ?? "");
                                _fakturPembayaranStream.add("");
                                _fakturPembayaranController = "";
                                _fakturPembayaranResult = null;
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
                                mipokaCustomToast('Sedang menyimpan data...', time: 5);
                                context.read<LaporanBloc>().add(
                                  UpdateLaporanEvent(
                                    laporan: laporan.copyWith(
                                      latarBelakang: _latarBelakangController.document.toPlainText(),
                                      hasilKegiatan: _hasilKegiatanController.document.toPlainText(),
                                      penutup: _penutupController.document.toPlainText(),
                                      fotoPostinganKegiatan: _postinganKegiatanController,
                                      fotoDokumentasiKegiatan: fotoDokumentasiKegiatanList,
                                      fotoTabulasiHasil: _tabulasiHasilKegiatanController,
                                      fotoFakturPembayaran: _fakturPembayaranController,
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              text: 'Sebelumnya',
                            ),
                            const SizedBox(width: 8.0),
                            CustomMipokaButton(
                              onTap: () async {
                                mipokaCustomToast('Sedang menyimpan data, mohon menunggu ...', time: 5);

                                if (_latarBelakangController.document.toPlainText().isNotEmpty && _hasilKegiatanController.document.toPlainText().isNotEmpty
                                && _penutupController.document.toPlainText().isNotEmpty) {

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
                                      _postinganKegiatanController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                    }
                                  }

                                  final dokumentasiKegiatanResult = _dokumentasiKegiatanResult;
                                  if (dokumentasiKegiatanResult != null) {
                                    PlatformFile file = dokumentasiKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _dokumentasiKegiatanController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                      fotoDokumentasiKegiatanList.add(_dokumentasiKegiatanController ?? "");
                                    }
                                  }

                                  final tabulasiHasilKegiatanResult = _tabulasiHasilKegiatanResult;
                                  if (tabulasiHasilKegiatanResult != null) {
                                    PlatformFile file = tabulasiHasilKegiatanResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _tabulasiHasilKegiatanController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                    }
                                  }

                                  final fakturPembayaranResult = _fakturPembayaranResult;
                                  if (fakturPembayaranResult != null) {
                                    PlatformFile file = fakturPembayaranResult.files.first;
                                    Uint8List? bytes;

                                    if (kIsWeb) {
                                      bytes = file.bytes;
                                    } else if (Platform.isAndroid) {
                                      bytes = await File(file.path!).readAsBytes();
                                    }

                                    if (bytes != null) {
                                      _fakturPembayaranController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                    }
                                  }

                                  Future.microtask(() {
                                    context.read<LaporanBloc>().add(
                                      UpdateLaporanEvent(
                                        laporan: laporan.copyWith(
                                          latarBelakang: _latarBelakangController.document.toPlainText(),
                                          hasilKegiatan: _hasilKegiatanController.document.toPlainText(),
                                          penutup: _penutupController.document.toPlainText(),
                                          fotoPostinganKegiatan: _postinganKegiatanController,
                                          fotoDokumentasiKegiatan: fotoDokumentasiKegiatanList,
                                          fotoTabulasiHasil: _tabulasiHasilKegiatanController,
                                          fotoFakturPembayaran: _fakturPembayaranController,
                                        ),
                                      ),
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      penggunaDaftarLaporanKegiatanPageRoute,
                                    );
                                    mipokaCustomToast('Laporan Kegiatan telah dikirim.');
                                  });
                                } else {
                                  mipokaCustomToast(emptyFieldMessage);
                                }
                              },
                              text: widget.laporanArgs.isRevisiLaporan == true ? 'Kirim Revisi' : 'Kirim',
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            } else if (state is LaporanError) {
              return Text(state.message);
            } else {
              return const Text("BLoC hasn't been trigerred.");
            }
          },
        ),
      ),
    );
  }
}
