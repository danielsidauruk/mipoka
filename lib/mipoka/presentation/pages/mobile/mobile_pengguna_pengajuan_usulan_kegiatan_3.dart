import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' as rich_text;


class MobilePenggunaPengajuanUsulanKegiatan3 extends StatefulWidget {
  const MobilePenggunaPengajuanUsulanKegiatan3({super.key});

  @override
  State<MobilePenggunaPengajuanUsulanKegiatan3> createState() => _MobilePenggunaPengajuanUsulanKegiatan3State();
}

class _MobilePenggunaPengajuanUsulanKegiatan3State extends State<MobilePenggunaPengajuanUsulanKegiatan3> {

  bool tempatKegiatan = false;
  bool jenisPartisipan = false;
  final _controller = rich_text.QuillController.basic();
  final _controllerToString = [];

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
                    buildTitle('Nama Ormawa'),

                    const SizedBox(height: 2.0),
                    
                    buildDescription('Berisi latar belakang kegiatan diusulkan'),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (query) {},
                        style: const TextStyle(),
                        decoration: null,
                      ),
                    ),

                    const SizedBox(height: 4.0),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      height: 400,
                      // constraints: const BoxConstraints(minHeight: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: rich_text.QuillEditor(
                        controller: _controller,
                        scrollController: ScrollController(),
                        focusNode: FocusNode(),
                        autoFocus: false,
                        readOnly: false,
                        expands: true,
                        padding: const EdgeInsets.all(8.0),
                        scrollable: true,
                      ),
                    ),

                    rich_text.QuillToolbar.basic(
                      controller: _controller,
                      toolbarIconSize: 20.0,
                      showBoldButton: true,
                      showItalicButton: true,
                      showUnderLineButton: true,
                      showColorButton: true,
                      showFontFamily: false,

                    ),

                    InkWell(
                      onTap: () {
                        List<Map<String, dynamic>> deltaList = _controller.document.toDelta().map((op) => op.toJson()).toList();
                        _controllerToString.addAll(deltaList);
                        print(_controllerToString);
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