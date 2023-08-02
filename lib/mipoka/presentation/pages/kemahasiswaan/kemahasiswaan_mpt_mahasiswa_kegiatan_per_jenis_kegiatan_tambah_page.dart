import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage> createState() => _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPageState();
}

class _KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPageState extends State<KemahasiswaanMPTMahasiswaKegiatanPerJenisKegiatanTambahPage> {

  final TextEditingController _namaJenisKegiatanController = TextEditingController();
  JenisKegiatanMpt? _jenisKegiatanMpt;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<JenisKegiatanMptBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MipokaMobileAppBar(
        onRefresh: () {
          mipokaCustomToast(refreshMessage);
          context.read<JenisKegiatanMptBloc>().add(const ReadAllJenisKegiatanMptEvent());
        },
      ),

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
                        final jenisKegiatanMpt = state.jenisKegiatanMptList;

                        List<String> jenisKegiatanDropDownList = jenisKegiatanMpt.map(
                                (jenisKegiatanList) => jenisKegiatanList.namaJenisKegiatanMpt).toList();

                        _jenisKegiatanMpt ??= jenisKegiatanMpt[0];

                        return MipokaCustomDropdown(
                          items: jenisKegiatanDropDownList,
                          initialItem: _jenisKegiatanMpt?.namaJenisKegiatanMpt,
                          onValueChanged: (value) {
                            int index = jenisKegiatanDropDownList.indexOf(value ?? "");
                            _jenisKegiatanMpt = state.jenisKegiatanMptList[index];
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
                        onTap: () {
                          if (_namaJenisKegiatanController.text.isNotEmpty && _jenisKegiatanMpt != null) {
                            mipokaCustomToast(savingDataMessage);

                            int uniqueId = UniqueIdGenerator.generateUniqueId();
                            String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                            Navigator.pop(
                              context,
                              NamaKegiatanMpt(
                                idNamaKegiatanMpt: uniqueId,
                                jenisKegiatanMpt: _jenisKegiatanMpt!,
                                namaKegiatan: _namaJenisKegiatanController.text,
                                createdAt: currentDate,
                                createdBy: user?.email ?? "unknown",
                                updatedAt: currentDate,
                                updatedBy: user?.email ?? "unknown",
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
