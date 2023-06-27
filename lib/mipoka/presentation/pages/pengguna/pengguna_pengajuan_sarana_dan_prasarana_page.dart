import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_check_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';

class PenggunaPengajuanSaranaDanPrasarana extends StatefulWidget {
  const PenggunaPengajuanSaranaDanPrasarana({super.key});

  @override
  State<PenggunaPengajuanSaranaDanPrasarana> createState() =>
      _PenggunaPengajuanSaranaDanPrasaranaState();
}

class _PenggunaPengajuanSaranaDanPrasaranaState
    extends State<PenggunaPengajuanSaranaDanPrasarana> {

  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();

  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<SessionBloc>(context, listen: false)
        .add(ReadAllSessionEvent());
    super.initState();
  }

  bool isChecked = false;

  final TextEditingController _proyektorLcdController = TextEditingController();
  final TextEditingController _laptopController = TextEditingController();
  final TextEditingController _mikrofonController = TextEditingController();
  final TextEditingController _speakerController = TextEditingController();
  final TextEditingController _tvController = TextEditingController();
  final TextEditingController _lampuController = TextEditingController();

  final QuillController _kegiatanController = QuillController.basic();
  final QuillController _lainController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          if (state is SessionLoading) {
            return const Text('Loading');
          } else if (state is AllSessionHasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomMobileTitle(
                        text: 'Pengajuan - Sarana dan Prasarana'),
                    const CustomFieldSpacer(),
                    CustomContentBox(

                      children: [
                        buildTitle('Nama Ormawa'),
                        MipokaCustomDropdown(
                          items: listNamaOrmawa,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),
                        buildTitle('Tanggal Mulai Kegiatan'),
                        CustomDatePickerField(controller: _tanggalMulaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Tanggal Selesai Kegiatan'),
                        CustomDatePickerField(controller: _tanggalSelesaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Gedung'),
                        MipokaCustomDropdown(
                          items: listGedung,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Ruang'),

                        MipokaCustomDropdown(
                          items: listGedung,
                          onValueChanged: (value) {},
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu Mulai Kegiatan'),
                        CustomTimePickerField(controller: _waktuMulaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu Selesai Kegiatan'),
                        CustomTimePickerField(controller: _waktuSelesaiController),

                        const CustomFieldSpacer(),

                        buildTitle('Perlengkapan yang dibutuhkan'),

                        const SizedBox(height: 4.0),

                        CustomCheckBox(
                          title: 'Proyektor/LCD',
                          controller: _proyektorLcdController,
                        ),
                        const SizedBox(height: 4.0),
                        CustomCheckBox(
                          title: 'Laptop',
                          controller: _laptopController,
                        ),
                        const SizedBox(height: 4.0),
                        CustomCheckBox(
                          title: 'Mikrofon',
                          controller: _mikrofonController,
                        ),
                        const SizedBox(height: 4.0),
                        CustomCheckBox(
                          title: 'Speaker',
                          controller: _speakerController,
                        ),
                        const SizedBox(height: 4.0),
                        CustomCheckBox(
                          title: 'TV',
                          controller: _tvController,
                        ),
                        const SizedBox(height: 4.0),
                        CustomCheckBox(
                          title: 'Lampu',
                          controller: _lampuController,
                        ),
                        const CustomFieldSpacer(),
                        buildTitle('Lain - lain'),
                        CustomRichTextField(controller: _lainController),
                        const CustomFieldSpacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () => Navigator.pop(context),
                              text: 'Batal',
                            ),
                            const SizedBox(width: 8.0),
                            CustomMipokaButton(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    penggunaDaftarPengajuanKegiatanPageRoute);
                              },
                              text: 'Kirim',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is SessionError) {
            return Text(state.message);
          } else {
            return const Text('IDK');
          }
        },
      ),
    );
  }
}
