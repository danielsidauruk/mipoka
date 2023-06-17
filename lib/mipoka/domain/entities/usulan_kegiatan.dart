import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UsulanKegiatan extends Equatable {
  final int idUsulan;
  final int idUser;
  final int idOrmawa;
  final String pembiayaan;
  final String namaKegiatan;
  final String bentukKegiatan;
  final String deskripsiKegiatan;
  final DateTime tanggalMulaiKegiatan;
  final DateTime tanggalSelesaiKegiatan;
  final TimeOfDay waktuMulaiKegiatan;
  final TimeOfDay waktuSelesaiKegiatan;
  final String tempatKegiatan;
  final DateTime tanggalKeberangkatan;
  final DateTime tanggalKepulangan;
  final int jumlahPartisipan;
  final String targetKegiatan;
  final int totalPendana;
  final String tandaTanganOrmawa;
  final int idPartisipan;
  final int idRincianBiayaKegiatan;
  final String ketuaOrmawa;
  final String pembina;
  final String latarBelakang;
  final String tujuanKegiatan;
  final String manfaatKegiatan;
  final String bentukPelaksanaanKegiatan;
  final String targetPencapaianKegiatan;
  final String waktuDanTempatPelaksanaan;
  final String rencanaAnggaranKegiatan;
  final int idPanitiaPeserta;
  final int idTertibAcara;
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

  const UsulanKegiatan({
    required this.idUsulan,
    required this.idUser,
    required this.idOrmawa,
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
    required this.totalPendana,
    required this.tandaTanganOrmawa,
    required this.idPartisipan,
    required this.idRincianBiayaKegiatan,
    required this.ketuaOrmawa,
    required this.pembina,
    required this.latarBelakang,
    required this.tujuanKegiatan,
    required this.manfaatKegiatan,
    required this.bentukPelaksanaanKegiatan,
    required this.targetPencapaianKegiatan,
    required this.waktuDanTempatPelaksanaan,
    required this.rencanaAnggaranKegiatan,
    required this.idPanitiaPeserta,
    required this.idTertibAcara,
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
  });

  UsulanKegiatan updateWith({
    int? idUsulan,
    int? idUser,
    int? idOrmawa,
    String? pembiayaan,
    String? namaKegiatan,
    String? bentukKegiatan,
    String? deskripsiKegiatan,
    DateTime? tanggalMulaiKegiatan,
    DateTime? tanggalSelesaiKegiatan,
    TimeOfDay? waktuMulaiKegiatan,
    TimeOfDay? waktuSelesaiKegiatan,
    String? tempatKegiatan,
    DateTime? tanggalKeberangkatan,
    DateTime? tanggalKepulangan,
    int? jumlahPartisipan,
    String? targetKegiatan,
    int? totalPendana,
    String? tandaTanganOrmawa,
    int? idPartisipan,
    int? idRincianBiayaKegiatan,
    String? ketuaOrmawa,
    String? pembina,
    String? latarBelakang,
    String? tujuanKegiatan,
    String? manfaatKegiatan,
    String? bentukPelaksanaanKegiatan,
    String? targetPencapaianKegiatan,
    String? waktuDanTempatPelaksanaan,
    String? rencanaAnggaranKegiatan,
    int? idPanitiaPeserta,
    int? idTertibAcara,
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
  }) {
    return UsulanKegiatan(
      idUsulan: idUsulan ?? this.idUsulan,
      idUser: idUser ?? this.idUser,
      idOrmawa: idOrmawa ?? this.idOrmawa,
      pembiayaan: pembiayaan ?? this.pembiayaan,
      namaKegiatan: namaKegiatan ?? this.namaKegiatan,
      bentukKegiatan: bentukKegiatan ?? this.bentukKegiatan,
      deskripsiKegiatan: deskripsiKegiatan ?? this.deskripsiKegiatan,
      tanggalMulaiKegiatan: tanggalMulaiKegiatan ?? this.tanggalMulaiKegiatan,
      tanggalSelesaiKegiatan: tanggalSelesaiKegiatan ??
          this.tanggalSelesaiKegiatan,
      waktuMulaiKegiatan: waktuMulaiKegiatan ?? this.waktuMulaiKegiatan,
      waktuSelesaiKegiatan: waktuSelesaiKegiatan ?? this.waktuSelesaiKegiatan,
      tempatKegiatan: tempatKegiatan ?? this.tempatKegiatan,
      tanggalKeberangkatan: tanggalKeberangkatan ?? this.tanggalKeberangkatan,
      tanggalKepulangan: tanggalKepulangan ?? this.tanggalKepulangan,
      jumlahPartisipan: jumlahPartisipan ?? this.jumlahPartisipan,
      targetKegiatan: targetKegiatan ?? this.targetKegiatan,
      totalPendana: totalPendana ?? this.totalPendana,
      tandaTanganOrmawa: tandaTanganOrmawa ?? this.tandaTanganOrmawa,
      idPartisipan: idPartisipan ?? this.idPartisipan,
      idRincianBiayaKegiatan: idRincianBiayaKegiatan ??
          this.idRincianBiayaKegiatan,
      ketuaOrmawa: ketuaOrmawa ?? this.ketuaOrmawa,
      pembina: pembina ?? this.pembina,
      latarBelakang: latarBelakang ?? this.latarBelakang,
      tujuanKegiatan: tujuanKegiatan ?? this.tujuanKegiatan,
      manfaatKegiatan: manfaatKegiatan ?? this.manfaatKegiatan,
      bentukPelaksanaanKegiatan: bentukPelaksanaanKegiatan ??
          this.bentukPelaksanaanKegiatan,
      targetPencapaianKegiatan: targetPencapaianKegiatan ??
          this.targetPencapaianKegiatan,
      waktuDanTempatPelaksanaan: waktuDanTempatPelaksanaan ??
          this.waktuDanTempatPelaksanaan,
      rencanaAnggaranKegiatan: rencanaAnggaranKegiatan ??
          this.rencanaAnggaranKegiatan,
      idPanitiaPeserta: idPanitiaPeserta ?? this.idPanitiaPeserta,
      idTertibAcara: idTertibAcara ?? this.idTertibAcara,
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
    );
  }

  @override
  List<Object?> get props {
    return [
      idUsulan,
      idUser,
      idOrmawa,
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
      totalPendana,
      tandaTanganOrmawa,
      idPartisipan,
      idRincianBiayaKegiatan,
      ketuaOrmawa,
      pembina,
      latarBelakang,
      tujuanKegiatan,
      manfaatKegiatan,
      bentukPelaksanaanKegiatan,
      targetPencapaianKegiatan,
      waktuDanTempatPelaksanaan,
      rencanaAnggaranKegiatan,
      idPanitiaPeserta,
      idTertibAcara,
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
    ];
  }
}

