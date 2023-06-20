import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
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
    required this.berita,
  });

  final Berita berita;

  @override
  State<KemahasiswaanBerandaUpdateBeritaPage> createState() => _KemahasiswaanBerandaUpdateBeritaPageState();
}

class _KemahasiswaanBerandaUpdateBeritaPageState extends State<KemahasiswaanBerandaUpdateBeritaPage> {
  final TextEditingController _judulBeritaController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  // final QuillController _textBeritaController = QuillController.basic();
  final TextEditingController _textBeritaController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final format = DateFormat("HH:mm");

  @override
  void initState() {
    _judulBeritaController.text = "berita.judulBerita";
    _penulisController.text = widget.berita.penulis;
    _textBeritaController.text = widget.berita.teks;
    _timeController.text = "12:08";
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

                  buildTitle('Tanggal Selesai Kegiatan'),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    constraints: const BoxConstraints(minHeight: 35.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DateTimeField(
                            controller: _timeController,
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Input Time',
                            ),
                            resetIcon: null,
                            format: format,
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.convert(time);
                            },
                          ),
                        ),
                        const Icon(
                          Icons.access_time,
                          size: 20,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    constraints: const BoxConstraints(minHeight: 35.0),
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: DateTimeField(
                      controller: _dateController,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Start Time',
                      ),
                      resetIcon: null,
                      format: DateFormat('yyyy-MM-dd'),
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: currentValue ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        return date;
                      },
                    ),
                  ),
                  // SizedBox(
                  //   width: 300,
                  //   child:  DateTimeField(
                  //     controller: _startTimeController,
                  //     decoration: InputDecoration(
                  //       enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.white),
                  //       ),
                  //       focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.white),
                  //       ),
                  //     ),
                  //     style: TextStyle(color: Colors.white, fontSize: 32),
                  //     format: format,
                  //     onShowPicker: (context, currentValue) async {
                  //       final time = await showTimePicker(
                  //         context: context,
                  //         initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  //       );
                  //       return DateTimeField.convert(time);
                  //     },
                  //   ),
                  // ),

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
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Kembali',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          context.read<BeritaBloc>().add(
                            UpdateBeritaEvent(
                              widget.berita.updateWith(
                                // jenisKegiatan: _judulBeritaController.text,
                                jenisKegiatan: _timeController.text,
                                penulis: _penulisController.text,
                                gambar: "https://random-d.uk/api/randomimg?t=1686482823678",
                                // teks: _textBeritaController.getPlainText(),
                                teks: _textBeritaController.text,
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Berita has been deleted successfully.'), duration: Duration(seconds: 1)),
                          );
                          Navigator.pop(context);
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