import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';

// => Just updated
class Laporan extends Equatable{
  final int idLaporan;
  final Ormawa ormawa;
  final User user;
  final UsulanKegiatan usulanKegiatan;
  final String pembiayaan;
  final String namaKegiatan;
  final String bentukKegiatan;
  final String deskripsiKegiatan;
  final DateTime tanggalMulaiKegiatan;
  final DateTime tanggalSelesaiKegiatan;
  final String waktuMulaiKegiatan;
  final String waktuSelesaiKegiatan;
  final String tempatKegiatan;
  final DateTime tanggalKeberangkatan;
  final DateTime tanggalKepulangan;
  final int jumlahPartisipan;
  final String targetKegiatan;
  final int totalPendanaan;
  final String tandaTanganOrmawa;
  final Partisipan partisipan;
  final RincianBiayaKegiatan rincianBiayaKegiatan;
  final String ketuaOrmawa;
  final String pembina;
  final String latarBelakang;
  final String tujuanKegiatan;
  final String manfaatKegiatan;
  final String bentukPelaksanaanKegiatan;
  final String targetPencapaianKegiatan;
  final String waktuDanTempatPelaksanaan;
  final String rencanaAnggaranKegiatan;
  final TertibAcara tertibAcara;
  final String perlengkapan;
  final String penutup;
  final String postinganKegiatan;
  final String dokumentasiKegiatan;
  final String tabulasiHasil;
  final String fakturPembayaran;
  final String status;
  final String validasiPembina;
  final String roles;
  final String file;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String filePeserta;
  final BiayaKegiatan biayaKegiatan;
  final PesertaKegiatanLaporan pesertaKegiatanLaporan;
  final String hasilKegiatan;
  final DateTime laporanUpdatedAt;
  final DateTime laporanCreatedAt;

  const Laporan({
    required this.idLaporan,
    required this.ormawa,
    required this.user,
    required this.usulanKegiatan,
    required this.pembiayaan,
    required this.namaKegiatan,
    required this.bentukKegiatan,
    required this.deskripsiKegiatan,
    required this.tanggalMulaiKegiatan,
    required this.tanggalSelesaiKegiatan,
    required this.waktuMulaiKegiatan,
    required this.waktuSelesaiKegiatan,
    required this.tempatKegiatan,
    required this.tanggalKeberangkatan,
    required this.tanggalKepulangan,
    required this.jumlahPartisipan,
    required this.targetKegiatan,
    required this.totalPendanaan,
    required this.tandaTanganOrmawa,
    required this.partisipan,
    required this.rincianBiayaKegiatan,
    required this.ketuaOrmawa,
    required this.pembina,
    required this.latarBelakang,
    required this.tujuanKegiatan,
    required this.manfaatKegiatan,
    required this.bentukPelaksanaanKegiatan,
    required this.targetPencapaianKegiatan,
    required this.waktuDanTempatPelaksanaan,
    required this.rencanaAnggaranKegiatan,
    required this.tertibAcara,
    required this.perlengkapan,
    required this.penutup,
    required this.postinganKegiatan,
    required this.dokumentasiKegiatan,
    required this.tabulasiHasil,
    required this.fakturPembayaran,
    required this.status,
    required this.validasiPembina,
    required this.roles,
    required this.file,
    required this.updatedAt,
    required this.createdAt,
    required this.filePeserta,
    required this.biayaKegiatan,
    required this.pesertaKegiatanLaporan,
    required this.hasilKegiatan,
    required this.laporanUpdatedAt,
    required this.laporanCreatedAt,
  });

  Laporan copyWith({
    int? idLaporan,
    Ormawa? ormawa,
    User? user,
    UsulanKegiatan? usulanKegiatan,
    String? pembiayaan,
    String? namaKegiatan,
    String? bentukKegiatan,
    String? deskripsiKegiatan,
    DateTime? tanggalMulaiKegiatan,
    DateTime? tanggalSelesaiKegiatan,
    String? waktuMulaiKegiatan,
    String? waktuSelesaiKegiatan,
    String? tempatKegiatan,
    DateTime? tanggalKeberangkatan,
    DateTime? tanggalKepulangan,
    int? jumlahPartisipan,
    String? targetKegiatan,
    int? totalPendanaan,
    String? tandaTanganOrmawa,
    Partisipan? partisipan,
    RincianBiayaKegiatan? rincianBiayaKegiatan,
    String? ketuaOrmawa,
    String? pembina,
    String? latarBelakang,
    String? tujuanKegiatan,
    String? manfaatKegiatan,
    String? bentukPelaksanaanKegiatan,
    String? targetPencapaianKegiatan,
    String? waktuDanTempatPelaksanaan,
    String? rencanaAnggaranKegiatan,
    TertibAcara? tertibAcara,
    String? perlengkapan,
    String? penutup,
    String? postinganKegiatan,
    String? dokumentasiKegiatan,
    String? tabulasiHasil,
    String? fakturPembayaran,
    String? status,
    String? validasiPembina,
    String? roles,
    String? file,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? filePeserta,
    BiayaKegiatan? biayaKegiatan,
    PesertaKegiatanLaporan? pesertaKegiatanLaporan,
    String? hasilKegiatan,
    DateTime? laporanUpdatedAt,
    DateTime? laporanCreatedAt,
  }) =>
      Laporan(
        idLaporan: idLaporan ?? this.idLaporan,
        ormawa: ormawa ?? this.ormawa,
        user: user ?? this.user,
        usulanKegiatan: usulanKegiatan ?? this.usulanKegiatan,
        pembiayaan: pembiayaan ?? this.pembiayaan,
        namaKegiatan: namaKegiatan ?? this.namaKegiatan,
        bentukKegiatan: bentukKegiatan ?? this.bentukKegiatan,
        deskripsiKegiatan: deskripsiKegiatan ?? this.deskripsiKegiatan,
        tanggalMulaiKegiatan: tanggalMulaiKegiatan ?? this.tanggalMulaiKegiatan,
        tanggalSelesaiKegiatan: tanggalSelesaiKegiatan ?? this.tanggalSelesaiKegiatan,
        waktuMulaiKegiatan: waktuMulaiKegiatan ?? this.waktuMulaiKegiatan,
        waktuSelesaiKegiatan: waktuSelesaiKegiatan ?? this.waktuSelesaiKegiatan,
        tempatKegiatan: tempatKegiatan ?? this.tempatKegiatan,
        tanggalKeberangkatan: tanggalKeberangkatan ?? this.tanggalKeberangkatan,
        tanggalKepulangan: tanggalKepulangan ?? this.tanggalKepulangan,
        jumlahPartisipan: jumlahPartisipan ?? this.jumlahPartisipan,
        targetKegiatan: targetKegiatan ?? this.targetKegiatan,
        totalPendanaan: totalPendanaan ?? this.totalPendanaan,
        tandaTanganOrmawa: tandaTanganOrmawa ?? this.tandaTanganOrmawa,
        partisipan: partisipan ?? this.partisipan,
        rincianBiayaKegiatan: rincianBiayaKegiatan ?? this.rincianBiayaKegiatan,
        ketuaOrmawa: ketuaOrmawa ?? this.ketuaOrmawa,
        pembina: pembina ?? this.pembina,
        latarBelakang: latarBelakang ?? this.latarBelakang,
        tujuanKegiatan: tujuanKegiatan ?? this.tujuanKegiatan,
        manfaatKegiatan: manfaatKegiatan ?? this.manfaatKegiatan,
        bentukPelaksanaanKegiatan: bentukPelaksanaanKegiatan ?? this.bentukPelaksanaanKegiatan,
        targetPencapaianKegiatan: targetPencapaianKegiatan ?? this.targetPencapaianKegiatan,
        waktuDanTempatPelaksanaan: waktuDanTempatPelaksanaan ?? this.waktuDanTempatPelaksanaan,
        rencanaAnggaranKegiatan: rencanaAnggaranKegiatan ?? this.rencanaAnggaranKegiatan,
        tertibAcara: tertibAcara ?? this.tertibAcara,
        perlengkapan: perlengkapan ?? this.perlengkapan,
        penutup: penutup ?? this.penutup,
        postinganKegiatan: postinganKegiatan ?? this.postinganKegiatan,
        dokumentasiKegiatan: dokumentasiKegiatan ?? this.dokumentasiKegiatan,
        tabulasiHasil: tabulasiHasil ?? this.tabulasiHasil,
        fakturPembayaran: fakturPembayaran ?? this.fakturPembayaran,
        status: status ?? this.status,
        validasiPembina: validasiPembina ?? this.validasiPembina,
        roles: roles ?? this.roles,
        file: file ?? this.file,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        filePeserta: filePeserta ?? this.filePeserta,
        biayaKegiatan: biayaKegiatan ?? this.biayaKegiatan,
        pesertaKegiatanLaporan: pesertaKegiatanLaporan ?? this.pesertaKegiatanLaporan,
        hasilKegiatan: hasilKegiatan ?? this.hasilKegiatan,
        laporanUpdatedAt: laporanUpdatedAt ?? this.laporanUpdatedAt,
        laporanCreatedAt: laporanCreatedAt ?? this.laporanCreatedAt,
      );

  @override
  List<Object?> get props => [
    idLaporan,
    ormawa,
    user,
    usulanKegiatan,
    pembiayaan,
    namaKegiatan,
    bentukKegiatan,
    deskripsiKegiatan,
    tanggalMulaiKegiatan,
    tanggalSelesaiKegiatan,
    waktuMulaiKegiatan,
    waktuSelesaiKegiatan,
    tempatKegiatan,
    tanggalKeberangkatan,
    tanggalKepulangan,
    jumlahPartisipan,
    targetKegiatan,
    totalPendanaan,
    tandaTanganOrmawa,
    partisipan,
    rincianBiayaKegiatan,
    ketuaOrmawa,
    pembina,
    latarBelakang,
    tujuanKegiatan,
    manfaatKegiatan,
    bentukPelaksanaanKegiatan,
    targetPencapaianKegiatan,
    waktuDanTempatPelaksanaan,
    rencanaAnggaranKegiatan,
    tertibAcara,
    perlengkapan,
    penutup,
    postinganKegiatan,
    dokumentasiKegiatan,
    tabulasiHasil,
    fakturPembayaran,
    status,
    validasiPembina,
    roles,
    file,
    updatedAt,
    createdAt,
    filePeserta,
    biayaKegiatan,
    pesertaKegiatanLaporan,
    hasilKegiatan,
    laporanUpdatedAt,
    laporanCreatedAt,
  ];
}