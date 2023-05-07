import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

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
              const SizedBox(height: 8.0),
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

                    const SizedBox(height: 2.0),

                    buildDescription('Berisi latar belakang kegiatan diusulkan'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        children: [
                          QuillToolbar.basic(
                            controller: _latarBelakangController,
                            axis: Axis.horizontal,
                            multiRowsDisplay: false,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: QuillEditor.basic(
                              controller: _latarBelakangController,
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        children: [
                          QuillToolbar.basic(
                            controller: _tujuanKegiatanController,
                            axis: Axis.horizontal,
                            multiRowsDisplay: false,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: QuillEditor.basic(
                              controller: _tujuanKegiatanController,
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 4.0,),

                    InkWell(
                      onTap: () {
                        List<Map<String, dynamic>> deltaList = _latarBelakangController.document.toDelta().map((op) => op.toJson()).toList();
                        _controllerToString.addAll(deltaList);
                        print(_controllerToString);
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

  Text buildDescription(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }
}
