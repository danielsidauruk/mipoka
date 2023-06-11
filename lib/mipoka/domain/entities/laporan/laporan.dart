import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Laporan extends Equatable {
  final int idLaporan;
  final int idOrmawa;
  final int idUser;
  final int idUsulan;
  final String namaKegiatan;
  final String bentuk;
  final String hasilK;
  final int totalDana;
  final String sumberDana;
  final String deskripsiKegiatan;
  final String tempatKegiatan;
  final TimeOfDay keberangkatan;
  final TimeOfDay kepulangan;
  final String jumlahPartisipan;
  final String bentukPelaksanaanKegiatan;
  final String hasilKegiatan;
  final String pembina;
  final String ketuaOrmawa;
  final String latarBelakang;
  final String waktuDanTempatPelaksanaan;
  final int panitiaPesertaL;
  final int idRincianBiayaKegiatan;
  final String penutup;
  final String idLampiranL;
  final String status;
  final String file;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String updatedBy;

  const Laporan({
    required this.idLaporan,
    required this.idOrmawa,
    required this.idUser,
    required this.idUsulan,
    required this.namaKegiatan,
    required this.bentuk,
    required this.hasilK,
    required this.totalDana,
    required this.sumberDana,
    required this.deskripsiKegiatan,
    required this.tempatKegiatan,
    required this.keberangkatan,
    required this.kepulangan,
    required this.jumlahPartisipan,
    required this.bentukPelaksanaanKegiatan,
    required this.hasilKegiatan,
    required this.pembina,
    required this.ketuaOrmawa,
    required this.latarBelakang,
    required this.waktuDanTempatPelaksanaan,
    required this.panitiaPesertaL,
    required this.idRincianBiayaKegiatan,
    required this.penutup,
    required this.idLampiranL,
    required this.status,
    required this.file,
    required this.updatedAt,
    required this.createdAt,
    required this.updatedBy,
  });

  @override
  List<Object?> get props => [
    idLaporan,
    idOrmawa,
    idUser,
    idUsulan,
    namaKegiatan,
    bentuk,
    hasilK,
    totalDana,
    sumberDana,
    deskripsiKegiatan,
    tempatKegiatan,
    keberangkatan,
    kepulangan,
    jumlahPartisipan,
    bentukPelaksanaanKegiatan,
    hasilKegiatan,
    pembina,
    ketuaOrmawa,
    latarBelakang,
    waktuDanTempatPelaksanaan,
    panitiaPesertaL,
    idRincianBiayaKegiatan,
    penutup,
    idLampiranL,
    status,
    file,
    updatedAt,
    createdAt,
    updatedBy,
  ];
}
