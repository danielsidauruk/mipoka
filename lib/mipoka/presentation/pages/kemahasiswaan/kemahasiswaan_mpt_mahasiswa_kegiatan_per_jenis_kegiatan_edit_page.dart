import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_drop_down_bloc/jenis_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPage({
    super.key,
    required this.namaKegiatanMpt
  });

  final NamaKegiatanMpt namaKegiatanMpt;

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPage> createState() =>
      _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanEditPage> {

  final TextEditingController _namaJenisKegiatanController = TextEditingController();
  JenisKegiatanMpt? _jenisKegiatanMpt;

  @override
  void initState() {
    context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
    _namaJenisKegiatanController.text = widget.namaKegiatanMpt.namaKegiatan;
    _jenisKegiatanMpt = widget.namaKegiatanMpt.jenisKegiatanMpt;
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Tambah Kegiatan per Jenis Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Nama Jenis Kegiatan'),

                  CustomTextField(controller: _namaJenisKegiatanController),

                  const CustomFieldSpacer(),

                  buildTitle('Jenis Kegiatan'),
                  BlocBuilder<JenisKegiatanMptBloc, JenisKegiatanMptState>(
                    builder: (context, state) {
                      if (state is JenisKegiatanMptLoading) {
                        return const Text("Loading ...");
                      } else if (state is AllJenisKegiatanMptHasData) {
                        final jenisKegiatanMptList = state.jenisKegiatanMptList;

                        List<String> namaJenisKegiatanList = jenisKegiatanMptList.map(
                                (jenisKegiatan) => jenisKegiatan.namaJenisKegiatanMpt).toList();

                        return MipokaCustomDropdown(
                          items: namaJenisKegiatanList,
                          initialItem: _jenisKegiatanMpt?.namaJenisKegiatanMpt,
                          onValueChanged: (value) {
                            int index = namaJenisKegiatanList.indexOf(value ?? "");
                            _jenisKegiatanMpt = jenisKegiatanMptList[index];
                          },
                        );
                      } else if (state is JenisKegiatanMptError) {
                        return Text(state.message);
                      } else {
                        return const Text("NamaKegiatanBloc hasn't been triggered yet.");
                      }
                    },
                  ),

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
                          if (_namaJenisKegiatanController.text.isNotEmpty && _jenisKegiatanMpt != null) {
                            mipokaCustomToast(savingDataMessage);

                            Navigator.pop(
                              context,
                              widget.namaKegiatanMpt.copyWith(
                                  namaKegiatan: _namaJenisKegiatanController.text,
                                  jenisKegiatanMpt: _jenisKegiatanMpt,
                                  updatedAt: currentDate,
                                  updatedBy: user?.email ?? "unknown"
                              ),
                            );
                          } else {
                            mipokaCustomToast(emptyFieldMessage);
                          }
                        },
                        text: 'Simpan',
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}