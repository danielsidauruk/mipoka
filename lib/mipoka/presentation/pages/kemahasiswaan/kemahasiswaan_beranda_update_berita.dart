import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/core/constanst.dart';
import 'package:uuid/uuid.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';

class KemahasiswaanBerandaUpdateBeritaPage extends StatefulWidget {
  const KemahasiswaanBerandaUpdateBeritaPage({
    super.key,
    required this.beritaId,
  });

  final int beritaId;

  @override
  State<KemahasiswaanBerandaUpdateBeritaPage> createState() => _KemahasiswaanBerandaUpdateBeritaPageState();
}

class _KemahasiswaanBerandaUpdateBeritaPageState extends State<KemahasiswaanBerandaUpdateBeritaPage> {
  final TextEditingController _judulBeritaController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  // final QuillController _textBeritaController = QuillController.basic();
  final TextEditingController _textBeritaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String uuid = const Uuid().v4();


    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomKemahasiswaanDrawer(),

      body: BlocBuilder<BeritaBloc, BeritaState>(
        builder: (context, state) {
          if (state is BeritaLoading) {
            return const Text('Loading');
          } else if (state is BeritaHasData) {
            final berita = state.berita[0];

            _judulBeritaController.text = "berita.judulBerita";
            _penulisController.text = berita.penulis;
            _textBeritaController.text = berita.teks;

            return SingleChildScrollView(
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
                        CustomIconButton(onTap: () {}, icon: Icons.upload),

                        const CustomFieldSpacer(),

                        buildTitle('Text Berita'),
                        // CustomRichTextField(controller: _textBeritaController),
                        CustomTextField(controller: _textBeritaController),

                        const CustomFieldSpacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              onTap: () => Navigator.pop(context),
                              text: 'Kembali',
                            ),

                            const SizedBox(width: 8.0),

                            CustomButton(
                              onTap: () {
                                context.read<BeritaBloc>().add(
                                  UpdateBeritaEvent(
                                    berita.copyWith(
                                      jenisKegiatan: _judulBeritaController.text,
                                      penulis: _penulisController.text,
                                      gambar: "https://random-d.uk/api/randomimg?t=1686482823678",
                                      // teks: _textBeritaController.getPlainText(),
                                      teks: _textBeritaController.text,
                                    ),
                                  ),
                                );
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
            );
          } else if (state is BeritaError) {
            return Text(state.message);
          } else {
            return const Text("BLoC hasn't triggered yet");
          }
        },
      ),
    );
  }
}