import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_add_button.dart';
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
    extends State<PenggunaPengajuanUsulanKegiatan3> with RouteAware {

  @override
  void initState() {
    BlocProvider.of<UsulanKegiatanBloc>(context)
        .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan));
    super.initState();
  }

  @override
  void didPop() {
    BlocProvider.of<UsulanKegiatanBloc>(context)
        .add(ReadUsulanKegiatanEvent(idUsulanKegiatan: widget.idUsulanKegiatan));
    super.didPop();
  }

  bool tertibAcara = false;
  late QuillController _latarBelakangController;
  late QuillController _tujuanKegiatanController;
  late QuillController _manfaatKegiatanController;
  late QuillController _bentukPelaksanaanKegiatanController;
  late QuillController _targetPencapaianKegiatanController;
  late QuillController _waktuDanTempatPelaksanaanKegiatanController;
  late QuillController _rencanaAnggaranKegiatanController;
  late QuillController _perlengkapanDanPeralatanController;
  late QuillController _penutupController;

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

                    _latarBelakangController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.latarBelakang),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _tujuanKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.tujuanKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _manfaatKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.manfaatKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _bentukPelaksanaanKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.bentukPelaksanaanKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _targetPencapaianKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.targetPencapaianKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _waktuDanTempatPelaksanaanKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.waktuDanTempatPelaksanaan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _rencanaAnggaranKegiatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.rencanaAnggaranKegiatan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _perlengkapanDanPeralatanController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.perlengkapan),
                      selection: const TextSelection.collapsed(offset: 0),
                    );
                    _penutupController = QuillController(
                      document: Document()..insert(0, usulanKegiatan.penutup),
                      selection: const TextSelection.collapsed(offset: 0),
                    );

                    return CustomContentBox(
                      children: [

                        buildTitle('Latar Belakang'),
                        buildDescription('Berisi latar belakang kegiatan diusulkan'),
                        CustomRichTextField(controller: _latarBelakangController),

                        const CustomFieldSpacer(),

                        buildTitle('Tujuan Kegiatan'),
                        buildDescription('Berisi tujuan kegiatan diusulkan'),
                        CustomRichTextField(controller: _tujuanKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Manfaat Kegiatan'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        CustomRichTextField(controller: _manfaatKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Bentuk Pelaksanaan Kegiatan'),
                        buildDescription(
                            'Berisi bentuk kegiatan diusulkan. Misalnya: Webinar, Seminar Onsite, Lomba, Bakti Sosial, dll'),
                        CustomRichTextField(
                            controller: _bentukPelaksanaanKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Target Pencapaian Kegiatan'),
                        buildDescription(
                            'Bagian ini berisi target yang akan dicapai. Mis: Lolos babak final, meraih juara 1,2,3 dst'),
                        CustomRichTextField(
                            controller: _targetPencapaianKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Waktu dan Tempat Pelaksanaan'),
                        buildDescription('Rincikan dengan jelas'),
                        CustomRichTextField(
                            controller: _waktuDanTempatPelaksanaanKegiatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Rencana Anggaran Kegiatan'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        CustomRichTextField(
                            controller: _rencanaAnggaranKegiatanController),

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

                        tertibAcara == true ?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildDescription(
                                    'Rincikan alur dari kegiatan yang akan dilaksanakan'),
                                CustomAddButton(
                                  buttonText: 'Tertib Acara',
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    penggunaPengajuanUsulanKegiatan3TertibAcaraTambahPageRoute,
                                    arguments: widget.idUsulanKegiatan,
                                  ),
                                ),

                                const CustomFieldSpacer(),

                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      columnSpacing: 40,
                                      border: TableBorder.all(color: Colors.white),
                                      columns: const [
                                        DataColumn(
                                          label: Text(
                                            'No.',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Waktu Mulai',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Waktu Selesai',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Aktivitas',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Keterangan',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(1, (int index) {
                                        final tertibAcara = usulanKegiatan.tertibAcara;
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${index + 1}',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  tertibAcara.waktuMulai,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  tertibAcara.waktuSelesai,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  tertibAcara.aktivitas,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  tertibAcara.keterangan,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            )

                        // InkWell(
                        //   onTap: () => Navigator.pushNamed(context,
                        //       penggunaPengajuanUsulanKegiatan3TertibAcaraPageRoute),
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     padding: const EdgeInsets.all(8.0),
                        //     constraints: const BoxConstraints(minHeight: 35.0),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //       border: Border.all(color: Colors.white),
                        //     ),
                        //     child: const Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text(
                        //           'Detail',
                        //           style: TextStyle(fontWeight: FontWeight.bold),
                        //         ),
                        //         Icon(
                        //           Icons.arrow_forward_ios,
                        //           size: 20,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // )
                            : const Center(),

                        const CustomFieldSpacer(),

                        buildTitle('Perlengkapan dan Peralatan (jika ada)'),
                        buildDescription('Berisi Manfaat Kegiatan Diusulkan'),
                        CustomRichTextField(
                            controller: _perlengkapanDanPeralatanController),

                        const CustomFieldSpacer(),

                        buildTitle('Penutup'),
                        CustomRichTextField(controller: _penutupController),

                        const CustomFieldSpacer(),

                        buildTitle('Lampiran - Lampiran'),

                        const CustomFieldSpacer(),

                        buildTitle('Postingan Kegiatan'),
                        buildDescription(
                            'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                        CustomFilePickerButton(
                          onTap: () => selectAndUploadFile(
                            'postingKegiatanButton',
                            widget.idUsulanKegiatan,
                          ),
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Postingan Kegiatan'),
                        buildDescription(
                            'Unggah spanduk / pamflet mengenai kegiatan yang ingin dilaksanakan.'),
                        CustomFilePickerButton(
                            onTap: () => selectAndUploadFile(
                              'postingKegiatanButton',
                              widget.idUsulanKegiatan,
                            ),
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Surat Undangan Kegiatan'),
                        buildDescription(
                            'Unggah foto surat undangan dari kegiatan yang akan dilaksanakan.'),
                        CustomFilePickerButton(
                            onTap: () => selectAndUploadFile(
                              'suratUndanganKegiatanButton',
                              widget.idUsulanKegiatan,
                            ),
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Linimasa Kegiatan'),
                        buildDescription(
                            'Unggah foto linimasa kegiatan yang akan dilaksanakan.'),
                        CustomFilePickerButton(
                          onTap: () => selectAndUploadFile(
                            'linimasaKegiatanButton',
                            widget.idUsulanKegiatan,
                          ),
                        ),

                        const CustomFieldSpacer(),

                        buildTitle('Tempat Kegiatan'),
                        buildDescription(
                            'Unggah foto tempat kegiatan yang akan dilaksanakan.'),
                        CustomFilePickerButton(
                          onTap: () => selectAndUploadFile(
                            'tempatKegiatanButton',
                            widget.idUsulanKegiatan,
                          ),
                        ),

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
                                      latarBelakang: _latarBelakangController.document.toPlainText(),
                                    ),
                                  ),
                                );

                                print('plainText: ${_latarBelakangController.document.toPlainText()}');
                                print('textStyle: ${_latarBelakangController.document.toDelta()}');
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
