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
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
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

  final TextEditingController _latarBelakangController = TextEditingController();
  final TextEditingController _hasilKegiatanController = TextEditingController();
  final TextEditingController _penutupController = TextEditingController();

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
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<LaporanBloc>().add(
              ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));
        },
      ),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
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

                  BlocConsumer<LaporanBloc, LaporanState>(
                    listenWhen: (prev, current) =>
                    prev.runtimeType != current.runtimeType,
                    listener: (context, state) async {
                      if (state is UpdateLaporanLastPageSuccess) {

                        context.read<LaporanBloc>().add(
                            ReadLaporanEvent(idLaporan: widget.laporanArgs.idLaporan));

                      } else if (state is UpdateLaporanAndSendSuccess) {

                        mipokaCustomToast('Laporan Kegiatan telah dikirim.');

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          penggunaDaftarLaporanKegiatanPageRoute,
                              (route) => false,
                        );

                      } else if (state is LaporanError) {
                        mipokaCustomToast(state.message);
                      }
                    },

                    builder: (context, state) {
                      if (state is LaporanLoading){
                        return const Text('Loading ...');
                      } else if (state is LaporanHasData) {
                        final laporan = state.laporan;

                        _latarBelakangController.text = laporan.latarBelakang;
                        _hasilKegiatanController.text = laporan.hasilKegiatan;
                        _penutupController.text = laporan.penutup;
                        _postinganKegiatanController = laporan.fotoPostinganKegiatan;
                        _tabulasiHasilKegiatanController = laporan.fotoTabulasiHasil;
                        _fakturPembayaranController = laporan.fotoFakturPembayaran;
                        _dokumentasiKegiatanController = laporan.fotoDokumentasiKegiatan;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            buildTitle('Latar Belakang'),
                            buildDescription('Berisi latar belakang kegiatan diusulkan'),
                            if (widget.laporanArgs.isRevisiLaporan == true
                                && laporan.revisiLaporan?.revisiLatarBelakang != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiLatarBelakang ?? ""),

                            CustomTextField(controller: _latarBelakangController),

                            const CustomFieldSpacer(),

                            buildTitle('Hasil Kegiatan'),
                            buildDescription('Berisi hasil kegiatan yang telah selesai'),
                            if (widget.laporanArgs.isRevisiLaporan == true
                                && laporan.revisiLaporan?.revisiHasilKegiatan != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiHasilKegiatan ?? ""),

                            CustomTextField(controller: _hasilKegiatanController),

                            const CustomFieldSpacer(),

                            buildTitle('Penutup'),
                            buildDescription('Ucapkan salam penutup.'),
                            if (widget.laporanArgs.isRevisiLaporan == true
                                && laporan.revisiLaporan?.revisiPenutup != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiPenutup ?? ""),

                            CustomTextField(controller: _penutupController),

                            const CustomFieldSpacer(),

                            buildTitle('Lampiran (Optional)'),

                            buildTitle('Postingan Kegiatan'),
                            buildDescription(
                                'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                            if (widget.laporanArgs.isRevisiLaporan == true
                                && laporan.revisiLaporan?.revisiFotoPostinganKegiatan != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiFotoPostinganKegiatan ?? ""),
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
                                      _postinganKegiatanStream.add(file?.name);
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
                                && laporan.revisiLaporan?.revisiFotoDokumentasiKegiatan != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiFotoDokumentasiKegiatan ?? ""),
                            StreamBuilder<String?>(
                              initialData: _dokumentasiKegiatanController,
                              stream: _dokumentasiKegiatanStream.stream,
                              builder: (context, snapshot) {
                                String text = snapshot.data ?? "";
                                return MipokaFileUploader(
                                  asset: "assets/icons/attach.png",
                                  onTap: () async {
                                    _dokumentasiKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                    PlatformFile? file = _dokumentasiKegiatanResult?.files.first;
                                    if (_dokumentasiKegiatanResult != null) {
                                      _dokumentasiKegiatanStream.add(file?.name);
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
                                && laporan.revisiLaporan?.revisiFotoTabulasiHasil != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiFotoTabulasiHasil ?? ""),
                            StreamBuilder<String?>(
                              initialData: _tabulasiHasilKegiatanController,
                              stream: _tabulasiHasilKegiatanStream.stream,
                              builder: (context, snapshot) {
                                String text = snapshot.data ?? "";
                                return MipokaFileUploader(
                                  asset: "assets/icons/attach.png",
                                  onTap: () async {
                                    _tabulasiHasilKegiatanResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                    PlatformFile? file = _tabulasiHasilKegiatanResult?.files.first;
                                    if (_tabulasiHasilKegiatanResult != null) {
                                      _tabulasiHasilKegiatanStream.add(file?.name);
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
                                && laporan.revisiLaporan?.revisiFotoFakturPembayaran != "")
                              buildRevisiText(laporan.revisiLaporan?.revisiFotoFakturPembayaran ?? ""),
                            StreamBuilder<String?>(
                              initialData: _fakturPembayaranController,
                              stream: _fakturPembayaranStream.stream,
                              builder: (context, snapshot) {
                                String text = snapshot.data ?? "";
                                return MipokaFileUploader(
                                  asset: "assets/icons/attach.png",
                                  onTap: () async {
                                    _fakturPembayaranResult = await FilePicker.platform.pickFiles(type: FileType.image);
                                    PlatformFile? file = _fakturPembayaranResult?.files.first;
                                    if (_fakturPembayaranResult != null) {
                                      _fakturPembayaranStream.add(file?.name);
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

                                    Navigator.pop(context, true);

                                    // final postinganKegiatanResult = _postinganKegiatanResult;
                                    // if (postinganKegiatanResult != null) {
                                    //   PlatformFile file = postinganKegiatanResult.files.first;
                                    //   Uint8List? bytes;
                                    //
                                    //   if (kIsWeb) {
                                    //     bytes = file.bytes;
                                    //   } else if (Platform.isAndroid) {
                                    //     bytes = await File(file.path!).readAsBytes();
                                    //   }
                                    //
                                    //   if (bytes != null) {
                                    //     int newId = UniqueIdGenerator.generateUniqueId();
                                    //     _postinganKegiatanController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                    //   }
                                    // }
                                    //
                                    // final dokumentasiKegiatanResult = _dokumentasiKegiatanResult;
                                    // if (dokumentasiKegiatanResult != null) {
                                    //   PlatformFile file = dokumentasiKegiatanResult.files.first;
                                    //   Uint8List? bytes;
                                    //
                                    //   if (kIsWeb) {
                                    //     bytes = file.bytes;
                                    //   } else if (Platform.isAndroid) {
                                    //     bytes = await File(file.path!).readAsBytes();
                                    //   }
                                    //
                                    //   if (bytes != null) {
                                    //     int newId = UniqueIdGenerator.generateUniqueId();
                                    //     _dokumentasiKegiatanController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                    //   }
                                    // }
                                    //
                                    // final tabulasiHasilKegiatanResult = _tabulasiHasilKegiatanResult;
                                    // if (tabulasiHasilKegiatanResult != null) {
                                    //   PlatformFile file = tabulasiHasilKegiatanResult.files.first;
                                    //   Uint8List? bytes;
                                    //
                                    //   if (kIsWeb) {
                                    //     bytes = file.bytes;
                                    //   } else if (Platform.isAndroid) {
                                    //     bytes = await File(file.path!).readAsBytes();
                                    //   }
                                    //
                                    //   if (bytes != null) {
                                    //     int newId = UniqueIdGenerator.generateUniqueId();
                                    //     _tabulasiHasilKegiatanController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                    //   }
                                    // }
                                    //
                                    // final fakturPembayaranResult = _fakturPembayaranResult;
                                    // if (fakturPembayaranResult != null) {
                                    //   PlatformFile file = fakturPembayaranResult.files.first;
                                    //   Uint8List? bytes;
                                    //
                                    //   if (kIsWeb) {
                                    //     bytes = file.bytes;
                                    //   } else if (Platform.isAndroid) {
                                    //     bytes = await File(file.path!).readAsBytes();
                                    //   }
                                    //
                                    //   if (bytes != null) {
                                    //     int newId = UniqueIdGenerator.generateUniqueId();
                                    //     _fakturPembayaranController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                    //   }
                                    // }
                                    //
                                    // if (context.mounted) {
                                    //   context.read<LaporanBloc>().add(
                                    //     UpdateLaporanLastPageEvent(
                                    //       laporan: laporan.copyWith(
                                    //         latarBelakang: _latarBelakangController.text,
                                    //         hasilKegiatan: _hasilKegiatanController.text,
                                    //         penutup: _penutupController.text,
                                    //         fotoPostinganKegiatan: _postinganKegiatanController,
                                    //         fotoDokumentasiKegiatan: _dokumentasiKegiatanController,
                                    //         fotoTabulasiHasil: _tabulasiHasilKegiatanController,
                                    //         fotoFakturPembayaran: _fakturPembayaranController,
                                    //       ),
                                    //     ),
                                    //   );
                                    // }
                                  },
                                  text: 'Sebelumnya',
                                ),

                                const SizedBox(width: 8.0),

                                CustomMipokaButton(
                                  onTap: () async {
                                    if (
                                    _latarBelakangController.text.isNotEmpty && _hasilKegiatanController.text.isNotEmpty
                                        && _penutupController.text.isNotEmpty &&
                                        (_postinganKegiatanController != "" || _postinganKegiatanResult != null &&
                                            _dokumentasiKegiatanController != "" || _dokumentasiKegiatanResult != null &&
                                            _tabulasiHasilKegiatanController != "" || _tabulasiHasilKegiatanResult != null &&
                                            _fakturPembayaranController != "" || _fakturPembayaranResult != null))
                                    {

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
                                          int newId = UniqueIdGenerator.generateUniqueId();
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
                                          int newId = UniqueIdGenerator.generateUniqueId();
                                          _dokumentasiKegiatanController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
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
                                          int newId = UniqueIdGenerator.generateUniqueId();
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
                                          int newId = UniqueIdGenerator.generateUniqueId();
                                          _fakturPembayaranController = await uploadBytesToFirebase(bytes, "$newId${file.name}");
                                        }
                                      }

                                      if (context.mounted) {
                                        mipokaCustomToast(savingDataMessage);
                                        context.read<LaporanBloc>().add(
                                          UpdateLaporanAndSendEvent(
                                            laporan: laporan.copyWith(
                                              latarBelakang: _latarBelakangController.text,
                                              hasilKegiatan: _hasilKegiatanController.text,
                                              penutup: _penutupController.text,
                                              fotoPostinganKegiatan: _postinganKegiatanController,
                                              fotoDokumentasiKegiatan: _dokumentasiKegiatanController,
                                              fotoTabulasiHasil: _tabulasiHasilKegiatanController,
                                              fotoFakturPembayaran: _fakturPembayaranController,
                                            ),
                                          ),
                                        );
                                      }
                                    } else {
                                      mipokaCustomToast(emptyFieldMessage);
                                    }
                                  },
                                  text: widget.laporanArgs.isRevisiLaporan == true ? 'Kirim Revisi' : 'Kirim',
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (state is LaporanError) {
                        return Text(state.message);
                      } else {
                        return const Text("BLoC hasn't been trigerred.");
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
