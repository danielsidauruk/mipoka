import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_switch.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';

class PenggunaPengajuanLaporanKegiatan3 extends StatefulWidget {
  const PenggunaPengajuanLaporanKegiatan3({
    required this.idLaporan,
    super.key,
  });

  final int idLaporan;

  @override
  State<PenggunaPengajuanLaporanKegiatan3> createState() =>
      _PenggunaPengajuanLaporanKegiatan3State();
}

class _PenggunaPengajuanLaporanKegiatan3State
    extends State<PenggunaPengajuanLaporanKegiatan3> {
  
  @override
  void initState() {
    context.read<LaporanBloc>().add(ReadLaporanEvent(idLaporan: widget.idLaporan));
    super.initState();
  }

  @override
  void dispose() {
    context.read<LaporanBloc>().close();
    super.dispose();
  }
  
  bool tempatKegiatan = false;
  bool isLampiran = false;

  late QuillController _latarBelakangController;
  late QuillController _hasilKegiatanController;
  late QuillController _penutupController;

  String? _postinganKegiatanController;
  final StreamController<String?> _postinganKegiatanStream = StreamController<String?>();

  String? _dokumentasiKegiatanController;
  final StreamController<String?> _dokumentasiKegiatanStream = StreamController<String?>();

  String? _tabulasiHasilKegiatanController;
  final StreamController<String?> _tabulasiHasilKegiatanStream = StreamController<String?>();

  String? _fakturPembayaranController;
  final StreamController<String?> _fakturPembayaranStream = StreamController<String?>();

  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  User? user = FirebaseAuth.instance.currentUser;

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
                        CustomRichTextField(controller: _latarBelakangController),

                        const CustomFieldSpacer(),

                        buildTitle('Hasil Kegiatan'),
                        buildDescription('Berisi hasil kegiatan yang telah selesai'),
                        CustomRichTextField(controller: _hasilKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Penutup'),
                        buildDescription('Ucapkan salam penutup.'),
                        CustomRichTextField(controller: _penutupController),

                        const CustomFieldSpacer(),

                        buildTitle('Lampiran'),

                        buildTitle('Postingan Kegiatan'),
                        buildDescription(
                            'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                        StreamBuilder<String?>(
                          stream: _postinganKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return CustomFilePickerButton(
                              onTap: () async {
                                String? url = await selectAndUploadFile('postingKegiatan${user?.uid ?? "unknown"}');
                                _postinganKegiatanController = url;
                                _postinganKegiatanStream.add(url);
                              },
                              onDelete: () {
                                _postinganKegiatanStream.add("");
                                _postinganKegiatanController = "";
                              },
                              text: text,
                            );
                          },
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Dokumentasi Kegiatan'),
                        buildDescription(
                            'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                        StreamBuilder<String?>(
                          stream: _dokumentasiKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return CustomFilePickerButton(
                              onTap: () async {
                                String? url = await selectAndUploadFile('postingKegiatan${user?.uid ?? "unknown"}');
                                _dokumentasiKegiatanController = url;
                                _dokumentasiKegiatanStream.add(url);
                              },
                              onDelete: () {
                                _dokumentasiKegiatanStream.add("");
                                _dokumentasiKegiatanController = "";
                              },
                              text: text,
                            );
                          },
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Tabulasi Hasil'),
                        buildDescription(
                            'Unggah foto pencapaian dari kegiatan yang telah dilaksanakan.'),
                        StreamBuilder<String?>(
                          stream: _tabulasiHasilKegiatanStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return CustomFilePickerButton(
                              onTap: () async {
                                String? url = await selectAndUploadFile('postingKegiatan${user?.uid ?? "unknown"}');
                                _tabulasiHasilKegiatanController = url;
                                _tabulasiHasilKegiatanStream.add(url);
                              },
                              onDelete: () {
                                _tabulasiHasilKegiatanStream.add("");
                                _tabulasiHasilKegiatanController = "";
                              },
                              text: text,
                            );
                          },
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Faktur Pembayaran'),
                        buildDescription(
                            'Unggah bon transaksi kegiatan yang telah dilaksanakan.'),
                        StreamBuilder<String?>(
                          stream: _fakturPembayaranStream.stream,
                          builder: (context, snapshot) {
                            String text = snapshot.data ?? "";
                            return CustomFilePickerButton(
                              onTap: () async {
                                String? url = await selectAndUploadFile('postingKegiatan${user?.uid ?? "unknown"}');
                                _fakturPembayaranController = url;
                                _fakturPembayaranStream.add(url);
                              },
                              onDelete: () {
                                _fakturPembayaranStream.add("");
                                _fakturPembayaranController = "";
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
                              onTap: () {
                                context.read<LaporanBloc>().add(
                                  UpdateLaporanEvent(
                                    laporan.copyWith(
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
                              onTap: () {
                                fotoDokumentasiKegiatanList.add(_dokumentasiKegiatanController ?? "");

                                context.read<LaporanBloc>().add(
                                  UpdateLaporanEvent(
                                    laporan.copyWith(
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
                              },
                              text: 'Kirim',
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
