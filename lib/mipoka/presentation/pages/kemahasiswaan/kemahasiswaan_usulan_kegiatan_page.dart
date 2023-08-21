import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/show_image_widget.dart';

class KemahasiswaanUsulanKegiatan extends StatefulWidget {
  final UsulanKegiatan usulanKegiatan;
  const KemahasiswaanUsulanKegiatan({
    super.key,
    required this.usulanKegiatan,
  });

  @override
  State<KemahasiswaanUsulanKegiatan> createState() =>
      _KemahasiswaanUsulanKegiatanState();
}

class _KemahasiswaanUsulanKegiatanState
    extends State<KemahasiswaanUsulanKegiatan> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final usulanKegiatan = widget.usulanKegiatan;

    return Scaffold(
      appBar: const MipokaMobileAppBar(),

      drawer: const CustomKemahasiswaanDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomMobileTitle(
                  text: 'Cek Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Nama Ormawa'),
                  customKemahasiswaanField(usulanKegiatan.ormawa?.namaOrmawa ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Pembiayaan'),
                  customKemahasiswaanField(usulanKegiatan.pembiayaan),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.namaKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Bentuk Kegiatan'),
                  customKemahasiswaanField("${usulanKegiatan.bentukKegiatan} (${usulanKegiatan.kategoriBentukKegiatan})"),

                  const CustomFieldSpacer(),

                  buildTitle('Deskripsi Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.deskripsiKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal Kegiatan'),
                  customKemahasiswaanField("${formatDateIndonesia(usulanKegiatan.tanggalMulaiKegiatan)} s.d. ${formatDateIndonesia(usulanKegiatan.tanggalSelesaiKegiatan)}"),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu Kegiatan'),
                  customKemahasiswaanField("${usulanKegiatan.waktuMulaiKegiatan} s.d. ${usulanKegiatan.waktuSelesaiKegiatan} WIB"),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.tempatKegiatan),

                  const CustomFieldSpacer(),

                  widget.usulanKegiatan.tanggalKeberangkatan != "-" && widget.usulanKegiatan.tanggalKeberangkatan != "" ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Tanggal Keberangkatan & Kepulangan'),
                      customKemahasiswaanField("${formatDateIndonesia(usulanKegiatan.tanggalKeberangkatan)} s.d. ${formatDateIndonesia(usulanKegiatan.tanggalKepulangan)}"),
                    ],
                  ) :
                  const SizedBox(),

                  const CustomFieldSpacer(),

                  buildTitle('Jumlah Partisipan'),
                  customKemahasiswaanField("${usulanKegiatan.jumlahPartisipan} ${usulanKegiatan.kategoriJumlahPartisipan}"),

                  const CustomFieldSpacer(),

                  buildTitle('Target Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.targetKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Total Pendanaan'),
                  customKemahasiswaanField(usulanKegiatan.totalPendanaan),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),
                  customKemahasiswaanField(usulanKegiatan.keterangan),

                  const CustomFieldSpacer(),

                  buildTitle('Data Peserta Kegiatan'),

                  usulanKegiatan.tanggalKeberangkatan == ""
                      || usulanKegiatan.tanggalKeberangkatan == "-" ?

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
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
                                'NIM/NIP',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Lengkap',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Peran',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Dasar Pengiriman',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          rows: List<DataRow>.generate(usulanKegiatan.partisipan.length, (int index) {
                            final partisipan = usulanKegiatan.partisipan[index];

                            return DataRow(
                              cells: [
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.noInduk),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.namaPartisipan),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.peranPartisipan),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.dasarPengiriman),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ) :
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
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
                                'NIM/NIP',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Lengkap',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'NIK',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Tempat/Tanggal Lahir',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Peran',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Dasar Pengiriman',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          rows: List<DataRow>.generate(usulanKegiatan.partisipan.length, (int index) {
                            final partisipan = usulanKegiatan.partisipan[index];

                            return DataRow(
                              cells: [
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${index + 1}',
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.noInduk),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.namaPartisipan),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.nik),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${partisipan.tempatLahir}/${partisipan.tglLahir}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.peranPartisipan),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan.dasarPengiriman),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Biaya Kegiatan'),
                  usulanKegiatan.biayaKegiatan.isNotEmpty ?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama Biaya',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Kuantitas',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Harga Satuan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Total',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Keterangan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          rows: List.generate(usulanKegiatan.biayaKegiatan.length, (int index) {
                            final biayaKegiatan = usulanKegiatan.biayaKegiatan[index];

                            return DataRow(
                              cells: [
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${index + 1}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(biayaKegiatan.namaBiayaKegiatan),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${biayaKegiatan.kuantiti}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${biayaKegiatan.hargaSatuan}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${biayaKegiatan.total}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(biayaKegiatan.keterangan),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ) :
                  customKemahasiswaanField("Tidak ada Biaya Kegiatan"),

                  const CustomFieldSpacer(),

                  buildTitle('Tertib Acara'),
                  usulanKegiatan.tertibAcara.isNotEmpty ?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
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
                                'Aktivitas',
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
                                'Keterangan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          rows: List<DataRow>.generate(usulanKegiatan.tertibAcara.length, (int index) {
                            final tertibAcara = usulanKegiatan.tertibAcara[index];
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
                                  InkWell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        tertibAcara.aktivitas,
                                        textAlign: TextAlign.center,
                                      ),
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
                  ) :
                  customKemahasiswaanField("Tidak ada Tertib Acara"),

                  const CustomFieldSpacer(),

                  buildTitle('Latar Belakang'),
                  customKemahasiswaanField(usulanKegiatan.latarBelakang),

                  const CustomFieldSpacer(),

                  buildTitle('Tujuan Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.tujuanKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Manfaat Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.manfaatKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Bentuk Pelaksanaan Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.bentukPelaksanaanKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Target Pencapaian Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.targetPencapaianKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu dan Tempat Pelaksanaan'),
                  customKemahasiswaanField(usulanKegiatan.waktuDanTempatPelaksanaan),

                  const CustomFieldSpacer(),

                  buildTitle('Rencana Anggaran Kegiatan'),
                  customKemahasiswaanField(usulanKegiatan.rencanaAnggaranKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Perlengkapan dan Peralatan'),
                  customKemahasiswaanField(usulanKegiatan.perlengkapanDanPeralatan),

                  const CustomFieldSpacer(),

                  buildTitle('Penutup'),
                  customKemahasiswaanField(usulanKegiatan.penutup),

                  const CustomFieldSpacer(),

                  if ( usulanKegiatan.fotoPostinganKegiatan != "" ||
                      usulanKegiatan.fotoSuratUndanganKegiatan != "" ||
                      usulanKegiatan.fotoLinimasaKegiatan != "" ||
                      usulanKegiatan.fotoTempatKegiatan != ""
                  )
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitle('Lampiran - Lampiran'),

                        const CustomFieldSpacer(height: 4.0),

                        usulanKegiatan.fotoPostinganKegiatan != "" ?
                        showImageWidget(
                          context,
                          usulanKegiatan.fotoPostinganKegiatan,
                          "Postingan Kegiatan",
                        ) :
                        const SizedBox(),

                        usulanKegiatan.fotoSuratUndanganKegiatan != "" ?
                        showImageWidget(
                          context,
                          usulanKegiatan.fotoSuratUndanganKegiatan,
                          "Surat Undangan Kegiatan",
                        ) :
                        const SizedBox(),

                        usulanKegiatan.fotoLinimasaKegiatan != "" ?
                        showImageWidget(
                          context,
                          usulanKegiatan.fotoLinimasaKegiatan,
                          "Linimasa Kegiatan",
                        ) :
                        const SizedBox(),

                        usulanKegiatan.fotoTempatKegiatan != "" ?
                        showImageWidget(
                          context,
                          usulanKegiatan.fotoTempatKegiatan,
                          "Tempat Kegiatan",
                        ):
                        const SizedBox(),

                        const CustomFieldSpacer(),
                      ],
                    ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () {
                          Navigator.pop(
                            context,
                            usulanKegiatan.copyWith(statusUsulan: ditolak),
                          );

                          mipokaCustomToast("Usulan Kegiatan ditolak");
                        },
                        text: "Tolak",
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () {
                          Navigator.pop(
                            context,
                            usulanKegiatan.copyWith(statusUsulan: disetujui),
                          );

                          mipokaCustomToast("Usulan Kegiatan disetujui");
                        },
                        text: "Terima",
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
