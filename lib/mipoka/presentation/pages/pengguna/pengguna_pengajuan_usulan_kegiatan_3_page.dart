import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/usulan_kegiatan_template.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_switch_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_switch.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_rich_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:http/http.dart' as http;

class PenggunaPengajuanUsulanKegiatan3 extends StatefulWidget {
  const PenggunaPengajuanUsulanKegiatan3({
    super.key,
    required this.idUsulanKegiatan,
  });

  final int idUsulanKegiatan;

  @override
  State<PenggunaPengajuanUsulanKegiatan3> createState() =>
      _PenggunaPengajuanUsulanKegiatan3State();
}

class _PenggunaPengajuanUsulanKegiatan3State
    extends State<PenggunaPengajuanUsulanKegiatan3> {

  @override
  void initState() {
    BlocProvider.of<UsulanKegiatanBloc>(context)
        .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan));
    super.initState();
  }

  bool tertibAcara = false;
  late QuillController _latarBelakangQuillController = QuillController.basic();


  final QuillController _tujuanKegiatanQuillController = QuillController.basic();
  final QuillController _manfaatKegiatanQuillController = QuillController.basic();
  final QuillController _bentukPelaksanaanKegiatanQuillController =
      QuillController.basic();
  final QuillController _targetPencapaianKegiatanQuillController =
      QuillController.basic();
  final QuillController _waktuDanTempatPelaksanaanKegiatanQuillController =
      QuillController.basic();
  final QuillController _rencanaAnggaranKegiatanQuillController =
      QuillController.basic();
  final QuillController _perlengkapanDanPeralatanQuillController =
      QuillController.basic();
  final QuillController _penutupQuillController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    print('Page 3 Reloaded');
    return Scaffold(
      appBar: const MipokaMobileAppBar(),
      drawer: const MobileCustomPenggunaDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),
              const CustomFieldSpacer(),
              BlocBuilder<UsulanKegiatanBloc, UsulanKegiatanState>(
                builder: (context, state) {
                  if (state is UsulanKegiatanLoading) {
                    return const Text('Loading');
                  } else if (state is UsulanKegiatanHasData) {
                    final usulanKegiatan = state.usulanKegiatan;

                    _latarBelakangQuillController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.latarBelakang),
                      selection: const TextSelection.collapsed(offset: 0),
                    );

                    return CustomContentBox(
                      children: [

                        buildTitle('Latar Belakang'),
                        buildDescription('Berisi latar belakang kegiatan diusulkan'),
                        CustomRichTextField(controller: _latarBelakangQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Tujuan Kegiatan'),
                        buildDescription('Berisi tujuan kegiatan diusulkan'),
                        CustomRichTextField(controller: _tujuanKegiatanQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Manfaat Kegiatan'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        CustomRichTextField(controller: _manfaatKegiatanQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Bentuk Pelaksanaan Kegiatan'),
                        buildDescription(
                            'Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                        CustomRichTextField(
                            controller: _bentukPelaksanaanKegiatanQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Target Pencapaian Kegiatan'),
                        buildDescription(
                            'Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                        CustomRichTextField(
                            controller: _targetPencapaianKegiatanQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu dan Tempat Pelaksanaan'),
                        buildDescription('Rincikan dengan jelas'),
                        CustomRichTextField(
                            controller: _waktuDanTempatPelaksanaanKegiatanQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Rencana Anggaran Kegiatan'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        CustomRichTextField(
                            controller: _rencanaAnggaranKegiatanQuillController),

                        const CustomFieldSpacer(),

                        MipokaCustomSwitchButton(
                          title: 'Tertib Acara',
                          option1: 'Tidak',
                          option2: 'Ya',
                          value: tertibAcara,
                          onChanged: (value) {
                            setState(() {
                              tertibAcara = value;
                            });
                          },
                        ),

                        tertibAcara == true
                            ? InkWell(
                          onTap: () => Navigator.pushNamed(context,
                              penggunaPengajuanUsulanKegiatan3TertibAcaraPageRoute),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            constraints: const BoxConstraints(minHeight: 35.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.white),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Detail',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        )
                            : const Center(),

                        const CustomFieldSpacer(),

                        buildTitle('Perlengkapan dan Peralatan (jika ada)'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        CustomRichTextField(
                            controller: _perlengkapanDanPeralatanQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Penutup'),
                        CustomRichTextField(controller: _penutupQuillController),

                        const CustomFieldSpacer(),

                        buildTitle('Lampiran - Lampiran'),

                        const CustomFieldSpacer(),

                        buildTitle('Postingan Kegiatan'),
                        buildDescription(
                            'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                        CustomFilePickerButton(
                            onTap: () => FileUploader.selectAndUploadFile(
                                'postingKegiatanButton')),

                        const CustomFieldSpacer(),

                        buildTitle('Postingan Kegiatan'),
                        buildDescription(
                            'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                        CustomFilePickerButton(
                            onTap: () => FileUploader.selectAndUploadFile(
                                'postingKegiatanButton')),

                        const CustomFieldSpacer(),

                        buildTitle('Surat Undangan Kegiatan'),
                        buildDescription(
                            'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                        CustomFilePickerButton(
                            onTap: () => FileUploader.selectAndUploadFile(
                                'suratUndanganKegiatanButton')),

                        const CustomFieldSpacer(),

                        buildTitle('Linimasa Kegiatan'),
                        buildDescription(
                            'Unggah foto linimasa kegiatan yang akan dilaksanakan.'),
                        CustomFilePickerButton(
                            onTap: () => FileUploader.selectAndUploadFile(
                                'linimasaKegiatanButton')),

                        const CustomFieldSpacer(),

                        buildTitle('Tempat Kegiatan'),
                        buildDescription(
                            'Unggah foto tempat kegiatan yang akan dilaksanakan.'),
                        CustomFilePickerButton(
                            onTap: () => FileUploader.selectAndUploadFile(
                                'tempatKegiatanButton')),

                        const CustomFieldSpacer(),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomMipokaButton(
                              onTap: () => Navigator.pop(context),
                              text: 'Sebelumnya',
                            ),

                            const SizedBox(width: 8.0),

                            CustomMipokaButton(
                              onTap: () {
                                Navigator.pushNamed(context, penggunaDaftarPengajuanKegiatanPageRoute);
                                context.read<UsulanKegiatanBloc>().add(
                                  UpdateUsulanKegiatanEvent(
                                    usulanKegiatan: usulanKegiatan.copyWith(
                                      latarBelakang: _latarBelakangQuillController.document.toPlainText(),
                                    ),
                                  ),
                                );

                                print('plainText: ${_latarBelakangQuillController.document.toPlainText()}');
                                print('textStyle: ${_latarBelakangQuillController.document.toDelta()}');
                                // // print('document ${_latarBelakangController.document.toDelta()}');
                              },
                              text: 'Kirim',
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is UsulanKegiatanError) {
                    return Text(state.message);
                  } else {
                    return const Text('IDK Page 3');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
