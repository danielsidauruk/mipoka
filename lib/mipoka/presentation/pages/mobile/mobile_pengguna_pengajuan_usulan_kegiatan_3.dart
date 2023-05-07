import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/rich_text_field.dart';

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
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'MIPOKA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const MobilePenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Pengajuan - Kegiatan - Usulan Kegiatan',
                      style: mobileTitle,
                    ),
                  ),
                ],
              ),
              spacingPerField(),
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

                    spacingPerField(),
                    
                    buildTitle('Tujuan Kegiatan'),
                    buildDescription('Berisi tujuan kegiatan diusulkan'),
                    RichTextField(controller: _tujuanKegiatanController),

                    spacingPerField(),

                    buildTitle('Manfaat Kegiatan'),
                    buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                    RichTextField(controller: _manfaatKegiatanController),

                    spacingPerField(),

                    buildTitle('Bentuk Pelaksanaan Kegiatan'),
                    buildDescription('Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                    RichTextField(controller: _bentukPelaksanaanKegiatanController),

                    spacingPerField(),

                    buildTitle('Target Pencapaian Kegiatan'),
                    buildDescription('Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                    RichTextField(controller: _targetPencapaianKegiatanController),

                    spacingPerField(),

                    buildTitle('Waktu dan Tempat Pelaksanaan'),
                    buildDescription('Rincikan dengan jelas'),
                    RichTextField(controller: _waktuDanTempatPelaksanaanKegiatanController),

                    spacingPerField(),

                    buildTitle('Rencana Anggaran Kegiatan'),
                    buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                    RichTextField(controller: _rencanaAnggaranKegiatanController),


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

  SizedBox spacingPerField() => const SizedBox(height: 8.0);

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
