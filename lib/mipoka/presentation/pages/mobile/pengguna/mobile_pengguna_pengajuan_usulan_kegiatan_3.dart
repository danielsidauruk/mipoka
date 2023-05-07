import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/field_spacer.dart';

class MobilePenggunaPengajuanUsulanKegiatan3 extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan3({Key? key}) : super(key: key);

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan3> createState() =>
      _MobilePenggunaPengajuanUsulanKegiatan3State();
}

class _MobilePenggunaPengajuanUsulanKegiatan3State
    extends State<MobilePenggunaPengajuanUsulanKegiatan3> {
  bool tempatKegiatan = false;
  bool jenisPartisipan = false;

  final QuillController _latarBelakangController = QuillController.basic();
  final QuillController _tujuanKegiatanController = QuillController.basic();
  final QuillController _manfaatKegiatanController = QuillController.basic();
  final QuillController _bentukPelaksanaanKegiatanController = QuillController.basic();
  final QuillController _targetPencapaianKegiatanController = QuillController.basic();
  final QuillController _waktuDanTempatPelaksanaanKegiatanController = QuillController.basic();
  final QuillController _rencanaAnggaranKegiatanController = QuillController.basic();
  final QuillController _perlengkapanDanPeralatanController = QuillController.basic();
  final QuillController _penutupController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaAppBar(),

      drawer: const MobilePenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const MobileTitle(text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const FieldSpacer(),

              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    buildTitle('Latar Belakang'),
                    buildDescription('Berisi latar belakang kegiatan diusulkan'),
                    RichTextField(controller: _latarBelakangController),

                    const FieldSpacer(),
                    
                    buildTitle('Tujuan Kegiatan'),
                    buildDescription('Berisi tujuan kegiatan diusulkan'),
                    RichTextField(controller: _tujuanKegiatanController),

                    const FieldSpacer(),

                    buildTitle('Manfaat Kegiatan'),
                    buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                    RichTextField(controller: _manfaatKegiatanController),

                    const FieldSpacer(),

                    buildTitle('Bentuk Pelaksanaan Kegiatan'),
                    buildDescription('Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                    RichTextField(controller: _bentukPelaksanaanKegiatanController),

                    const FieldSpacer(),

                    buildTitle('Target Pencapaian Kegiatan'),
                    buildDescription('Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                    RichTextField(controller: _targetPencapaianKegiatanController),

                    const FieldSpacer(),

                    buildTitle('Waktu dan Tempat Pelaksanaan'),
                    buildDescription('Rincikan dengan jelas'),
                    RichTextField(controller: _waktuDanTempatPelaksanaanKegiatanController),

                    const FieldSpacer(),

                    buildTitle('Rencana Anggaran Kegiatan'),
                    buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                    RichTextField(controller: _rencanaAnggaranKegiatanController),

                    const FieldSpacer(),

                    InkWell(
                      onTap: () {
                        print(_latarBelakangController.document.toPlainText());
                      },
                      child: const Text('Print Controller'),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildDescription(String text) {
    return Column(
      children: [
        const SizedBox(height: 2.0),

        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 4.0),
      ],
    );
  }
}
