import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PengajuanKegiatan extends Equatable {
  final String namaOrmawa;
  final String pembiayaan;
  final String namaKegiatan;
  final bool bentukKegiatan;
  final String namaBentukKegiatan;
  final String deskripsiKegiatan;
  final DateTime tanggalMulaiKegiatan;
  final DateTime tanggalSelesaiKegiatan;
  final TimeOfDay waktuMulaiKegiatan;
  final TimeOfDay waktuSelesaiKegiatan;
  final bool tempatKegiatan;
  final String namaTempatKegiatan;
  final DateTime tanggalKeberangkatan;
  final DateTime tanggalKepulangan;
  final bool jenisPartisipan;
  final int jumlahPartisipan;
  final String targetKegiatan;
  final double totalPendanaan;
  final String keterangan;
  final String pathTandaTanganOrmawa;

  final String latarBelakang;
  final String tujuanKegiatan;
  final String manfaatKegiatan;
  final String


  const PengajuanKegiatan({
    required this.namaOrmawa,
    required this.pembiayaan,
    required this.namaKegiatan,
    required this.bentukKegiatan,
    required this.namaBentukKegiatan,
    required this.deskripsiKegiatan,
    required this.tanggalMulaiKegiatan,
    required this.tanggalSelesaiKegiatan,
    required this.waktuMulaiKegiatan,
    required this.waktuSelesaiKegiatan,
    required this.tempatKegiatan,
    required this.namaTempatKegiatan,
    required this.tanggalKeberangkatan,
    required this.tanggalKepulangan,
    required this.jenisPartisipan,
    required this.jumlahPartisipan,
    required this.targetKegiatan,
    required this.totalPendanaan,
    required this.keterangan,
    required this.pathTandaTanganOrmawa,
  });

  @override
  List<Object?> get props => [
    namaOrmawa,
    pembiayaan,
    namaKegiatan,
    bentukKegiatan,
    namaBentukKegiatan,
    deskripsiKegiatan,
    tanggalMulaiKegiatan,
    tanggalSelesaiKegiatan,
    waktuMulaiKegiatan,
    waktuSelesaiKegiatan,
    tempatKegiatan,
    namaTempatKegiatan,
    tanggalKeberangkatan,
    tanggalKepulangan,
    jenisPartisipan,
    jumlahPartisipan,
    targetKegiatan,
    totalPendanaan,
    keterangan,
    pathTandaTanganOrmawa,
  ];
}
