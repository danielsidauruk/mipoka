import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
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
    BlocProvider.of<LaporanBloc>(context, listen: false).add(
        ReadLaporanEvent(idLaporan: widget.idLaporan));
    super.initState();
  }
  
  bool tempatKegiatan = false;
  bool isLampiran = false;

  late QuillController _latarBelakangController;
  late QuillController _hasilKegiatanController;
  late QuillController _penutupController;

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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildTitle('Lampiran'),
                            Switch(
                              value: isLampiran,
                              onChanged: (bool newValue) {
                                setState(() => isLampiran = newValue);
                              },
                            ),
                            Expanded(
                              child: isLampiran == false
                                  ? buildTitle('Tidak')
                                  : buildTitle('Ya'),
                            ),
                          ],
                        ),
                        isLampiran != false
                            ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomFieldSpacer(),
                            buildTitle('Postingan Kegiatan'),
                            buildDescription(
                                'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                            CustomFilePickerButton(
                              onTap: () => selectAndUploadFile(
                                  'postingLaporanKegiatanButton',
                                  1
                              ),
                            ),
                            const CustomFieldSpacer(),
                            buildTitle('Dokumentasi Kegiatan'),
                            buildDescription(
                                'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                            CustomFilePickerButton(
                              onTap: () => selectAndUploadFile(
                                'dokumentasiKegiatanButton',
                                1,
                              ),
                            ),
                            const CustomFieldSpacer(),
                            buildTitle('Tabulasi Hasil'),
                            buildDescription(
                                'Unggah foto pencapaian dari kegiatan yang telah dilaksanakan.'),
                            CustomFilePickerButton(
                              onTap: () =>selectAndUploadFile(
                                'tabulasiHasilButton',
                                1,
                              ),
                            ),
                            const CustomFieldSpacer(),
                            buildTitle('Faktur Pembayaran'),
                            buildDescription(
                                'Unggah bon transaksi kegiatan yang telah dilaksanakan.'),
                            CustomFilePickerButton(
                              onTap: () => selectAndUploadFile(
                                'fakturPembayaranButton',
                                1,
                              ),
                            ),
                          ],
                        )
                            : const Center(),
                        const CustomFieldSpacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              text: 'Sebelumnya',
                            ),
                            const SizedBox(width: 8.0),
                            CustomMipokaButton(
                              onTap: () {
                                print(laporan);
                                context.read<LaporanBloc>().add(
                                  UpdateLaporanEvent(
                                    laporan.copyWith(
                                      latarBelakang: _latarBelakangController.document.toPlainText(),
                                      hasilKegiatan: _hasilKegiatanController.document.toPlainText(),
                                      penutup: _penutupController.document.toPlainText(),
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
