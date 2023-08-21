import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/domain/utils/uniqe_id_generator.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_check_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_date_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_dropdown.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_time_picker_field.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class KemahasiswaanSaranaDanPrasarana extends StatefulWidget {
  final Session session;
  const KemahasiswaanSaranaDanPrasarana({
    required this.session,
    super.key
  });

  @override
  State<KemahasiswaanSaranaDanPrasarana> createState() =>
      _KemahasiswaanSaranaDanPrasaranaState();
}

class _KemahasiswaanSaranaDanPrasaranaState
    extends State<KemahasiswaanSaranaDanPrasarana> {

  @override
  Widget build(BuildContext context) {
    Session session = widget.session;

    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(text: 'Cek Pengajuan - Sarana dan Prasarana'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Nama Ormawa'),
                      customKemahasiswaanField(session.ormawa?.namaOrmawa ?? ""),

                      const CustomFieldSpacer(),

                      buildTitle('Tanggal'),
                      customKemahasiswaanField("${formatDateIndonesia(session.tanggalMulai)} s.d. ${formatDateIndonesia(session.tanggalSelesai)}"),

                      const CustomFieldSpacer(),

                      buildTitle('Ruang/Gedung'),
                      customKemahasiswaanField("${session.ruang}/${session.gedung}"),

                      const CustomFieldSpacer(),

                      buildTitle('Lama Penggunaan'),
                      customKemahasiswaanField("${session.waktuMulaiPenggunaan} s.d ${session.waktuSelesaiPenggunaan}"),

                      const CustomFieldSpacer(),

                      buildTitle('Kegiatan'),
                      customKemahasiswaanField(session.kegiatan),

                      const CustomFieldSpacer(),

                      buildTitle('Perlengkapan yang dibutuhkan dalam kegiatan tersebut :'),

                      const SizedBox(height: 4.0),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DataTable(
                          columnSpacing: 40,
                          border: TableBorder.all(color: Colors.white),
                          columns: const [
                            DataColumn(label: Text('Perlengkapan')),
                            DataColumn(label: Text('Unit')),
                          ],
                          rows: [
                            if(session.proyektor != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Proyektor/LCD'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.proyektor}'),
                                    ),
                                  ),
                                ],
                              ),

                            if(session.laptop != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Laptop'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.laptop}'),
                                    ),
                                  ),
                                ],
                              ),

                            if(session.mikrofon != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Mikrofon'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.mikrofon}'),
                                    ),
                                  ),
                                ],
                              ),

                            if(session.speaker != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Speaker'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.speaker}'),
                                    ),
                                  ),
                                ],
                              ),

                            if(session.meja != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Meja'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.meja}'),
                                    ),
                                  ),
                                ],
                              ),

                            if(session.kursi != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Kursi'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.kursi}'),
                                    ),
                                  ),
                                ],
                              ),

                            if(session.papanTulis != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Papan Tulis'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.papanTulis}'),
                                    ),
                                  ),
                                ],
                              ),

                            if(session.spidol != 0)
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Center(
                                      child: Text('Spidol'),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text('${session.spidol}'),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),

                      const CustomFieldSpacer(),

                      buildTitle('Lain - lain '),
                      customKemahasiswaanField(session.lainLain),

                      const CustomFieldSpacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomMipokaButton(
                            onTap: () {
                              Navigator.pop(context, session.copyWith(status: ditolak));

                              mipokaCustomToast("Pengajuan Sarana & Prasarana Ditolak");
                            },
                            text: 'Tolak',
                          ),

                          const SizedBox(width: 8.0),

                          CustomMipokaButton(
                            onTap: () {
                              Navigator.pop(context, session.copyWith(status: disetujui));

                              mipokaCustomToast("Pengajuan Sarana & Prasarana Disetujui");
                            },
                            text: 'Setujui',
                          ),
                        ],
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

