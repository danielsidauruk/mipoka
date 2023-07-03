import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanBerandaUpdateBeritaPage extends StatefulWidget {
  const KemahasiswaanBerandaUpdateBeritaPage({
    super.key,
    required this.berita,
  });

  final Berita berita;

  @override
  State<KemahasiswaanBerandaUpdateBeritaPage> createState() => _KemahasiswaanBerandaUpdateBeritaPageState();
}

class _KemahasiswaanBerandaUpdateBeritaPageState extends State<KemahasiswaanBerandaUpdateBeritaPage> {
  final TextEditingController _judulBeritaController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final TextEditingController _textBeritaController = TextEditingController();
  final StreamController<String?> _fotoBeritaStream = StreamController<String?>();
  String? _fotoBeritaController;

  @override
  void initState() {
    _judulBeritaController.text = widget.berita.judul;
    _penulisController.text = widget.berita.penulis;
    _fotoBeritaController = widget.berita.gambar;
    _textBeritaController.text = widget.berita.teks;

    if(_fotoBeritaController != "") {
      _fotoBeritaStream.add(_fotoBeritaController);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(text: 'Kemahasiswaan - Edit Beranda - Tambah'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Judul Berita'),

                  CustomTextField(controller: _judulBeritaController),

                  const CustomFieldSpacer(),

                  buildTitle('Penulis'),

                  CustomTextField(controller: _penulisController),

                  const CustomFieldSpacer(),
                  StreamBuilder<String?>(
                    stream: _fotoBeritaStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('postingKegiatan${user?.uid ?? "unknown"}');
                          _fotoBeritaController = url;
                          _fotoBeritaStream.add(url);
                        },
                        onDelete: () {
                          _fotoBeritaController = "";
                          _fotoBeritaStream.add("");
                        },
                        text: text,
                      );
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Text Berita'),
                  CustomTextField(controller: _textBeritaController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          context.read<BeritaBloc>().add(
                            UpdateBeritaEvent(
                              widget.berita.copyWith(
                                judul: _judulBeritaController.text,
                                penulis: _penulisController.text,
                                gambar: _fotoBeritaController,
                                teks: _textBeritaController.text,
                                updatedBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                              ),
                            ),
                          );
                          Navigator.pop(context);
                          mipokaCustomToast("Berita telah diupdate");
                        },
                        text: 'Simpan',
                      ),
                    ],
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