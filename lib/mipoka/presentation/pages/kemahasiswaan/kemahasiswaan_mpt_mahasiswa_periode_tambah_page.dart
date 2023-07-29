import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class KemahasiswaanMPTMahasiswaPeriodeTambahPage extends StatefulWidget {
  const KemahasiswaanMPTMahasiswaPeriodeTambahPage({super.key});

  @override
  State<KemahasiswaanMPTMahasiswaPeriodeTambahPage> createState() => _KemahasiswaanMPTMahasiswaPeriodeTambahPageState();
}

class _KemahasiswaanMPTMahasiswaPeriodeTambahPageState extends State<KemahasiswaanMPTMahasiswaPeriodeTambahPage> {

  final TextEditingController _tahunController = TextEditingController();
  final TextEditingController _tanggalMulaiController = TextEditingController();
  final TextEditingController _tanggalSelesaiController = TextEditingController();
  final StreamController<bool> _isPeriodeMengulangMptStream = StreamController<bool>();
  bool _isPeriodeMengulangMpt = false;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _tahunController.text = periodeYears.first;
    super.initState();
  }

  @override
  void dispose() {
    _isPeriodeMengulangMptStream.close();
    super.dispose();
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

              const CustomMobileTitle(text: 'Kemahasiswaan - MPT Mahasiswa - Tambah Periode'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  
                  buildTitle('Tahun'),

                  MipokaCustomDropdown(
                    items: periodeYears,
                    onValueChanged: (value) {
                      _tahunController.text = value ?? "";
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<bool>(
                        stream: _isPeriodeMengulangMptStream.stream,
                        initialData: _isPeriodeMengulangMpt,
                        builder: (context, snapshot) {
                          bool isChecked = snapshot.data ?? false;
                          return Checkbox(
                            checkColor: Colors.black,
                            value: isChecked,
                            onChanged: (value) {
                              _isPeriodeMengulangMpt = value ?? false;
                              _isPeriodeMengulangMptStream.add(value ?? false);
                            },
                          );
                        },
                      ),

                      const Text(
                        "Tahun Mengulang",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  buildTitle('Tanggal Mulai'),
                  CustomDatePickerField(controller: _tanggalMulaiController),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal Selesai'),
                  CustomDatePickerField(controller: _tanggalSelesaiController),

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
                            if (_tahunController.text.isNotEmpty && _tanggalMulaiController.text.isNotEmpty &&
                                _tanggalSelesaiController.text.isNotEmpty) {

                              mipokaCustomToast(savingDataMessage);
                              int uniqueId = UniqueIdGenerator.generateUniqueId();
                              String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

                              Navigator.pop(
                                context,
                                PeriodeMpt(
                                  idPeriodeMpt: uniqueId,
                                  tahunPeriodeMpt: _tahunController.text,
                                  periodeMengulangMpt: _isPeriodeMengulangMpt,
                                  tanggalMulaiPeriodeMpt: _tanggalMulaiController.text,
                                  tanggalBerakhirPeriodeMpt: _tanggalSelesaiController.text,
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
                          text: 'Simpan'
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
