import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:uuid/uuid.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanBerandaBeritaPage extends StatefulWidget {
  const KemahasiswaanBerandaBeritaPage({super.key});

  @override
  State<KemahasiswaanBerandaBeritaPage> createState() => _KemahasiswaanBerandaBeritaPageState();
}

class _KemahasiswaanBerandaBeritaPageState extends State<KemahasiswaanBerandaBeritaPage> {
  final TextEditingController _judulBeritaController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final TextEditingController _textBeritaController = TextEditingController();
  final StreamController<String?> _fotoBeritaStream = StreamController<String?>();
  String? _fotoBerita;

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
              const CustomMobileTitle(text: 'Kemahasiswaan - Beranda - Tambah Berita'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Judul Berita'),
                  
                  CustomTextField(controller: _judulBeritaController),

                  const CustomFieldSpacer(),

                  buildTitle('Penulis'),

                  CustomTextField(controller: _penulisController),

                  const CustomFieldSpacer(),
                  
                  buildTitle('Tambah Gambar'),
                  StreamBuilder<String?>(
                    stream: _fotoBeritaStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return CustomFilePickerButton(
                        onTap: () async {
                          String? url = await selectAndUploadFile('foto$newId');
                          _fotoBerita = url;
                          _fotoBeritaStream.add(url);
                        },
                        onDelete: () {
                          _fotoBerita = "";
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
                          if (_judulBeritaController.text.isNotEmpty && _penulisController.text.isNotEmpty &&
                              _textBeritaController.text.isNotEmpty) {
                            context.read<BeritaBloc>().add(
                              CreateBeritaEvent(
                                Berita(
                                  idBerita: newId,
                                  judul: _judulBeritaController.text,
                                  penulis: _judulBeritaController.text,
                                  gambar: _fotoBerita ?? "",
                                  teks: _textBeritaController.text,
                                  tglTerbit: currentDate,
                                  createdAt: currentDate,
                                  createdBy: user?.email ?? "unknown",
                                  updatedAt: currentDate,
                                  updatedBy: user?.email ?? "unknown",
                                ),
                              ),
                            );
                            context.read<BeritaBloc>().add(const ReadAllBeritaEvent());
                            Navigator.pop(context, true);
                            mipokaCustomToast("Berita berhasil ditambahkan.");
                          } else {
                            mipokaCustomToast("Harap isi semua field.");
                          }
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