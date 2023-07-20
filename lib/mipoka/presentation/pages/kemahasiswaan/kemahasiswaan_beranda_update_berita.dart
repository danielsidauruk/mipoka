import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/mipoka/presentation/pages/kemahasiswaan/kemahasiswaan_beranda_tambah_berita.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
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
import 'package:mipoka/mipoka/presentation/widgets/mipoka_file_uploader.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';

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

  final StreamController<String?> _filePickerStream = StreamController<String?>.broadcast();
  String? _fotoBeritaController;
  FilePickerResult? _result;

  @override
  void initState() {
    _judulBeritaController.text = widget.berita.judul;
    _penulisController.text = widget.berita.penulis;
    _fotoBeritaController = widget.berita.gambar;
    _textBeritaController.text = widget.berita.teks;

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
                  buildTitle('Tambah Gambar'),

                  StreamBuilder<String?>(
                    initialData: _fotoBeritaController,
                    stream: _filePickerStream.stream,
                    builder: (context, snapshot) {
                      String text = snapshot.data ?? "";
                      return MipokaFileUploader(
                        asset: "assets/icons/attach.png",
                        onTap: () async {
                          _result = await FilePicker.platform.pickFiles();
                          PlatformFile? file = _result?.files.first;
                          if (_result != null) {
                            if (file?.extension!.toLowerCase() == 'jpg' ||
                                file?.extension!.toLowerCase() == 'jpeg' ||
                                file?.extension!.toLowerCase() == 'png' ||
                                file?.extension!.toLowerCase() == 'gif'){
                              _filePickerStream.add(_result?.files.first.name);
                            } else {
                              mipokaCustomToast("Tipe data file bukan gambar.");
                            }
                          }
                        },
                        onDelete: () {
                          deleteFileFromFirebase(_fotoBeritaController ?? "");
                          _filePickerStream.add("");
                          _fotoBeritaController = "";
                          _result = null;
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
                        onTap: () async {
                          if (_judulBeritaController.text.isNotEmpty && _penulisController.text.isNotEmpty &&
                              _textBeritaController.text.isNotEmpty) {

                            final result = _result;
                            if (result != null) {
                              PlatformFile file = result.files.first;
                              Uint8List? bytes;

                              if (kIsWeb) {
                                bytes = file.bytes;
                              } else if (Platform.isAndroid) {
                                bytes = await File(file.path!).readAsBytes();
                              }

                              if (bytes != null) {
                                mipokaCustomToast(savingDataMessage);
                                _fotoBeritaController = await uploadBytesToFirebase(bytes, "${widget.berita.idBerita}${file.name}");
                              }
                            }

                            if (context.mounted) {
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
                            }
                          } else {
                            mipokaCustomToast("Harap isi semua field.");
                          }
                        },
                        text: 'Simpan',
                      ),

                      BlocListener<BeritaBloc, BeritaState>(
                        listenWhen: (prev, current) =>
                        prev.runtimeType != current.runtimeType,
                        listener: (context, state) {
                          if (state is BeritaSuccessMessage) {
                            mipokaCustomToast("Berita telah diupdate");
                            Navigator.pop(context);
                          } else if (state is BeritaError) {
                            mipokaCustomToast(state.message);
                          }
                        },
                        child: const SizedBox(),
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
