import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';

class UsulanKegiatan extends Equatable{
  final int idUsulan;
  final String idUser;
  final int idOrmawa;
  final String pembiayaan;
  final String namaKegiatan;
  final String bentukKegiatan;
  final String kategoriBentukKegiatan;
  final String deskripsiKegiatan;
  final String tanggalMulaiKegiatan;
  final String tanggalSelesaiKegiatan;
  final String waktuMulaiKegiatan;
  final String waktuSelesaiKegiatan;
  final String tempatKegiatan;
  final String tanggalKeberangkatan;
  final String tanggalKepulangan;
  final String jumlahPartisipan;
  final String kategoriJumlahPartisipan;
  final String targetKegiatan;
  final String totalPendanaan;
  final String kategoriTotalPendanaan;
  final String keterangan;
  final String tandaTanganOrmawa;
  final List<Partisipan> partisipan;
  final List<BiayaKegiatan> biayaKegiatan;
  final int totalBiaya;
  final String latarBelakang;
  final String tujuanKegiatan;
  final String manfaatKegiatan;
  final String bentukPelaksanaanKegiatan;
  final String targetPencapaianKegiatan;
  final String waktuDanTempatPelaksanaan;
  final String rencanaAnggaranKegiatan;
  final List<TertibAcara> tertibAcara;
  final String perlengkapanDanPeralatan;
  final String penutup;
  final String fotoPostinganKegiatan;
  final String fotoSuratUndanganKegiatan;
  final String fotoLinimasaKegiatan;
  final String fotoTempatKegiatan;
  final String fileUsulanKegiatan;
  final String validasiPembina;
  final String tandaTanganPembina;
  final String statusUsulan;
  final String roles;
  final String createdAt;
  final String updatedAt;
  final String createdBy;
  final String updatedBy;

  const UsulanKegiatan({
    required this.idUsulan,
    required this.idUser,
    required this.idOrmawa,
    required this.pembiayaan,
    required this.namaKegiatan,
    required this.bentukKegiatan,
    required this.kategoriBentukKegiatan,
    required this.deskripsiKegiatan,
    required this.tanggalMulaiKegiatan,
    required this.tanggalSelesaiKegiatan,
    required this.waktuMulaiKegiatan,
    required this.waktuSelesaiKegiatan,
    required this.tempatKegiatan,
    required this.tanggalKeberangkatan,
    required this.tanggalKepulangan,
    required this.jumlahPartisipan,
    required this.kategoriJumlahPartisipan,
    required this.targetKegiatan,
    required this.totalPendanaan,
    required this.kategoriTotalPendanaan,
    required this.keterangan,
    required this.tandaTanganOrmawa,
    required this.partisipan,
    required this.biayaKegiatan,
    required this.totalBiaya,
    required this.latarBelakang,
    required this.tujuanKegiatan,
    required this.manfaatKegiatan,
    required this.bentukPelaksanaanKegiatan,
    required this.targetPencapaianKegiatan,
    required this.waktuDanTempatPelaksanaan,
    required this.rencanaAnggaranKegiatan,
    required this.tertibAcara,
    required this.perlengkapanDanPeralatan,
    required this.penutup,
    required this.fotoPostinganKegiatan,
    required this.fotoSuratUndanganKegiatan,
    required this.fotoLinimasaKegiatan,
    required this.fotoTempatKegiatan,
    required this.fileUsulanKegiatan,
    required this.validasiPembina,
    required this.tandaTanganPembina,
    required this.statusUsulan,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  UsulanKegiatan copyWith({
    int? idUsulan,
    String? idUser,
    int? idOrmawa,
    String? pembiayaan,
    String? namaKegiatan,
    String? bentukKegiatan,
    String? kategoriBentukKegiatan,
    String? deskripsiKegiatan,
    String? tanggalMulaiKegiatan,
    String? tanggalSelesaiKegiatan,
    String? waktuMulaiKegiatan,
    String? waktuSelesaiKegiatan,
    String? tempatKegiatan,
    String? tanggalKeberangkatan,
    String? tanggalKepulangan,
    String? jumlahPartisipan,
    String? kategoriJumlahPartisipan,
    String? targetKegiatan,
    String? totalPendanaan,
    String? kategoriTotalPendanaan,
    String? keterangan,
    String? tandaTanganOrmawa,
    List<Partisipan>? partisipan,
    List<BiayaKegiatan>? biayaKegiatan,
    int? totalBiaya,
    String? latarBelakang,
    String? tujuanKegiatan,
    String? manfaatKegiatan,
    String? bentukPelaksanaanKegiatan,
    String? targetPencapaianKegiatan,
    String? waktuDanTempatPelaksanaan,
    String? rencanaAnggaranKegiatan,
    List<TertibAcara>? tertibAcara,
    String? perlengkapanDanPeralatan,
    String? penutup,
    String? fotoPostinganKegiatan,
    String? fotoSuratUndanganKegiatan,
    String? fotoLinimasaKegiatan,
    String? fotoTempatKegiatan,
    String? fileUsulanKegiatan,
    String? validasiPembina,
    String? tandaTanganPembina,
    String? statusUsulan,
    String? roles,
    String? createdAt,
    String? updatedAt,
    String? createdBy,
    String? updatedBy,
  }) =>
      UsulanKegiatan(
        idUsulan: idUsulan ?? this.idUsulan,
        idUser: idUser ?? this.idUser,
        idOrmawa: idOrmawa ?? this.idOrmawa,
        pembiayaan: pembiayaan ?? this.pembiayaan,
        namaKegiatan: namaKegiatan ?? this.namaKegiatan,
        bentukKegiatan: bentukKegiatan ?? this.bentukKegiatan,
        kategoriBentukKegiatan: kategoriBentukKegiatan ?? this.kategoriBentukKegiatan,
        deskripsiKegiatan: deskripsiKegiatan ?? this.deskripsiKegiatan,
        tanggalMulaiKegiatan: tanggalMulaiKegiatan ?? this.tanggalMulaiKegiatan,
        tanggalSelesaiKegiatan: tanggalSelesaiKegiatan ?? this.tanggalSelesaiKegiatan,
        waktuMulaiKegiatan: waktuMulaiKegiatan ?? this.waktuMulaiKegiatan,
        waktuSelesaiKegiatan: waktuSelesaiKegiatan ?? this.waktuSelesaiKegiatan,
        tempatKegiatan: tempatKegiatan ?? this.tempatKegiatan,
        tanggalKeberangkatan: tanggalKeberangkatan ?? this.tanggalKeberangkatan,
        tanggalKepulangan: tanggalKepulangan ?? this.tanggalKepulangan,
        jumlahPartisipan: jumlahPartisipan ?? this.jumlahPartisipan,
        kategoriJumlahPartisipan: kategoriJumlahPartisipan ?? this.kategoriJumlahPartisipan,
        targetKegiatan: targetKegiatan ?? this.targetKegiatan,
        totalPendanaan: totalPendanaan ?? this.totalPendanaan,
        kategoriTotalPendanaan: kategoriTotalPendanaan ?? this.kategoriTotalPendanaan,
        keterangan: keterangan ?? this.keterangan,
        tandaTanganOrmawa: tandaTanganOrmawa ?? this.tandaTanganOrmawa,
        partisipan: partisipan ?? this.partisipan,
        biayaKegiatan: biayaKegiatan ?? this.biayaKegiatan,
        totalBiaya: totalBiaya ?? this.totalBiaya,
        latarBelakang: latarBelakang ?? this.latarBelakang,
        tujuanKegiatan: tujuanKegiatan ?? this.tujuanKegiatan,
        manfaatKegiatan: manfaatKegiatan ?? this.manfaatKegiatan,
        bentukPelaksanaanKegiatan: bentukPelaksanaanKegiatan ?? this.bentukPelaksanaanKegiatan,
        targetPencapaianKegiatan: targetPencapaianKegiatan ?? this.targetPencapaianKegiatan,
        waktuDanTempatPelaksanaan: waktuDanTempatPelaksanaan ?? this.waktuDanTempatPelaksanaan,
        rencanaAnggaranKegiatan: rencanaAnggaranKegiatan ?? this.rencanaAnggaranKegiatan,
        tertibAcara: tertibAcara ?? this.tertibAcara,
        perlengkapanDanPeralatan: perlengkapanDanPeralatan ?? this.perlengkapanDanPeralatan,
        penutup: penutup ?? this.penutup,
        fotoPostinganKegiatan: fotoPostinganKegiatan ?? this.fotoPostinganKegiatan,
        fotoSuratUndanganKegiatan: fotoSuratUndanganKegiatan ?? this.fotoSuratUndanganKegiatan,
        fotoLinimasaKegiatan: fotoLinimasaKegiatan ?? this.fotoLinimasaKegiatan,
        fotoTempatKegiatan: fotoTempatKegiatan ?? this.fotoTempatKegiatan,
        fileUsulanKegiatan: fileUsulanKegiatan ?? this.fileUsulanKegiatan,
        validasiPembina: validasiPembina ?? this.validasiPembina,
        tandaTanganPembina: tandaTanganPembina ?? this.tandaTanganPembina,
        statusUsulan: statusUsulan ?? this.statusUsulan,
        roles: roles ?? this.roles,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idUsulan,
    idUser,
    idOrmawa,
    pembiayaan,
    namaKegiatan,
    bentukKegiatan,
    kategoriBentukKegiatan,
    deskripsiKegiatan,
    tanggalMulaiKegiatan,
    tanggalSelesaiKegiatan,
    waktuMulaiKegiatan,
    waktuSelesaiKegiatan,
    tempatKegiatan,
    tanggalKeberangkatan,
    tanggalKepulangan,
    jumlahPartisipan,
    kategoriJumlahPartisipan,
    targetKegiatan,
    totalPendanaan,
    kategoriTotalPendanaan,
    keterangan,
    tandaTanganOrmawa,
    partisipan,
    biayaKegiatan,
    latarBelakang,
    tujuanKegiatan,
    manfaatKegiatan,
    bentukPelaksanaanKegiatan,
    targetPencapaianKegiatan,
    waktuDanTempatPelaksanaan,
    rencanaAnggaranKegiatan,
    tertibAcara,
    perlengkapanDanPeralatan,
    penutup,
    fotoPostinganKegiatan,
    fotoSuratUndanganKegiatan,
    fotoLinimasaKegiatan,
    fotoTempatKegiatan,
    fileUsulanKegiatan,
    validasiPembina,
    tandaTanganPembina,
    statusUsulan,
    roles,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy,
  ];
}
