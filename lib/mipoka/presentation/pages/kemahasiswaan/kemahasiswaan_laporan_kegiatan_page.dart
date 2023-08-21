import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/format_date_indonesia.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/kemahasiswaan/kemahasiswaan_custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';
import 'package:mipoka/mipoka/presentation/widgets/show_image_widget.dart';

class KemahasiswaanLaporanKegiatan extends StatefulWidget {
  final Laporan laporan;
  const KemahasiswaanLaporanKegiatan({
    super.key,
    required this.laporan,
  });

  @override
  State<KemahasiswaanLaporanKegiatan> createState() =>
      _KemahasiswaanLaporanKegiatanState();
}

class _KemahasiswaanLaporanKegiatanState
    extends State<KemahasiswaanLaporanKegiatan> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final laporan = widget.laporan;

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
                  text: 'Pengajuan - Kegiatan - Usulan Kegiatan'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [
                  buildTitle('Nama Ormawa'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.ormawa?.namaOrmawa ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Pembiayaan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.pembiayaan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Nama Kegiatan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.namaKegiatan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Bentuk Kegiatan'),
                  customKemahasiswaanField("${laporan.usulanKegiatan?.bentukKegiatan} (${laporan.usulanKegiatan?.kategoriBentukKegiatan})"),

                  const CustomFieldSpacer(),

                  buildTitle('Deskripsi Kegiatan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.deskripsiKegiatan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Tanggal Kegiatan'),
                  customKemahasiswaanField("${formatDateIndonesia(laporan.usulanKegiatan?.tanggalMulaiKegiatan ?? "")} s.d. ${formatDateIndonesia(laporan.usulanKegiatan?.tanggalSelesaiKegiatan ?? "")}"),
                  const CustomFieldSpacer(),

                  buildTitle('Waktu Kegiatan'),
                  customKemahasiswaanField("${laporan.usulanKegiatan?.waktuMulaiKegiatan} s.d. ${laporan.usulanKegiatan?.waktuSelesaiKegiatan}"),

                  const CustomFieldSpacer(),

                  buildTitle('Tempat Kegiatan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.tempatKegiatan ?? ""),

                  const CustomFieldSpacer(),

                  widget.laporan.usulanKegiatan?.tanggalKeberangkatan != "-" && widget.laporan.usulanKegiatan?.tanggalKeberangkatan != "" ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Tanggal Keberangkatan & Kepulangan'),
                      customKemahasiswaanField("${laporan.usulanKegiatan?.tanggalKeberangkatan} s.d ${laporan.usulanKegiatan?.tanggalKepulangan} WIB"),
                    ],
                  ) :
                  const SizedBox(),

                  const CustomFieldSpacer(),

                  buildTitle('Jumlah Partisipan'),
                  customKemahasiswaanField("${laporan.usulanKegiatan?.jumlahPartisipan} ${laporan.usulanKegiatan?.kategoriJumlahPartisipan}"),

                  const CustomFieldSpacer(),

                  buildTitle('Target Kegiatan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.targetKegiatan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Total Pendanaan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.totalPendanaan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.keterangan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Latar Belakang'),
                  customKemahasiswaanField(laporan.latarBelakang),

                  const CustomFieldSpacer(),

                  buildTitle('Bentuk Pelaksanaan Kegiatan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.bentukPelaksanaanKegiatan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Hasil Kegiatan'),
                  customKemahasiswaanField(laporan.hasilKegiatan),

                  const CustomFieldSpacer(),

                  buildTitle('Waktu dan Tempat Pelaksanaan'),
                  customKemahasiswaanField(laporan.usulanKegiatan?.waktuDanTempatPelaksanaan ?? ""),

                  const CustomFieldSpacer(),

                  buildTitle('Partisipan Kegiatan'),

                  laporan.pesertaKegiatanLaporan.isEmpty ?
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
                          ],
                          rows: List<DataRow>.generate(laporan.usulanKegiatan!.partisipan.length, (int index) {
                            final partisipan = laporan.usulanKegiatan?.partisipan[index];

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
                                    child: Text(partisipan?.noInduk ?? ""),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan?.namaPartisipan ?? ""),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(partisipan?.peranPartisipan ?? ""),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Panitia'),
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
                              ],
                              rows: List<DataRow>.generate(laporan.usulanKegiatan!.partisipan.length, (int index) {
                                final partisipan = laporan.usulanKegiatan?.partisipan[index];

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
                                        child: Text(partisipan?.noInduk ?? ""),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(partisipan?.namaPartisipan ?? ""),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(partisipan?.peranPartisipan ?? ""),
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

                      buildTitle('Peserta'),
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
                              ],
                              rows: List<DataRow>.generate(laporan.pesertaKegiatanLaporan.length, (int index) {
                                final peserta = laporan.pesertaKegiatanLaporan[index];

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
                                        child: Text(
                                          peserta.nim,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          peserta.namaLengkap,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          peserta.peran,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Realisasi Anggaran Kegiatan'),
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
                              label: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Kuantitas',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
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
                                'Usulan Anggaran',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Realisasi Anggaran',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Selisih',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          rows: List.generate(laporan.rincianBiayaKegiatan.length, (int index) {
                            final rincianBiaya = laporan.rincianBiayaKegiatan[index];

                            return DataRow(
                              cells: [
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('${index + 1}'),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(rincianBiaya.namaBiaya),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${rincianBiaya.kuantitas}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${rincianBiaya.hargaSatuan}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child:
                                    Text("${rincianBiaya.usulanAnggaran}"),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("${rincianBiaya.realisasiAnggaran}")
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${rincianBiaya.selisih}"),
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

                  buildTitle('Penutup'),
                  customKemahasiswaanField(laporan.penutup),

                  const CustomFieldSpacer(),

                  if ( laporan.fotoPostinganKegiatan != "" ||
                      laporan.fotoDokumentasiKegiatan != "" ||
                      laporan.fotoTabulasiHasil != "" ||
                      laporan.fotoFakturPembayaran != ""
                  )
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitle('Lampiran - Lampiran'),

                        const CustomFieldSpacer(height: 4.0),

                        laporan.fotoPostinganKegiatan != "" ?
                        showImageWidget(
                          context,
                          laporan.fotoPostinganKegiatan,
                          "Postingan Kegiatan",
                        ) :
                        const SizedBox(),

                        laporan.fotoDokumentasiKegiatan != "" ?
                        showImageWidget(
                          context,
                          laporan.fotoDokumentasiKegiatan,
                          "Dokumentasi Kegiatan",
                        ) :
                        const SizedBox(),

                        laporan.fotoTabulasiHasil != "" ?
                        showImageWidget(
                          context,
                          laporan.fotoTabulasiHasil,
                          "Tabulasi Hasil",
                        ):
                        const SizedBox(),

                        laporan.fotoFakturPembayaran != "" ?
                        showImageWidget(
                          context,
                          laporan.fotoFakturPembayaran,
                          "Faktu Pembayaran",
                        ) :
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
                            laporan.copyWith(statusLaporan: ditolak),
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
                            laporan.copyWith(statusLaporan: disetujui),
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
