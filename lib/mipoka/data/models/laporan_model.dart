import 'package:flutter/material.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';

class LaporanModel extends Laporan {
  const LaporanModel({
    required int idLaporan,
    required int idOrmawa,
    required int idUser,
    required int idUsulan,
    required String namaKegiatan,
    required String bentuk,
    required String hasilK,
    required int totalDana,
    required String sumberDana,
    required String deskripsiKegiatan,
    required String tempatKegiatan,
    required TimeOfDay keberangkatan,
    required TimeOfDay kepulangan,
    required String jumlahPartisipan,
    required String bentukPelaksanaanKegiatan,
    required String hasilKegiatan,
    required String pembina,
    required String ketuaOrmawa,
    required String latarBelakang,
    required String waktuDanTempatPelaksanaan,
    required int panitiaPesertaL,
    required int idRincianBiayaKegiatan,
    required String penutup,
    required String idLampiranL,
    required String status,
    required String file,
    required DateTime updatedAt,
    required DateTime createdAt,
    required String updatedBy,
  }) : super(
    idLaporan: idLaporan,
    idOrmawa: idOrmawa,
    idUser: idUser,
    idUsulan: idUsulan,
    namaKegiatan: namaKegiatan,
    bentuk: bentuk,
    hasilK: hasilK,
    totalDana: totalDana,
    sumberDana: sumberDana,
    deskripsiKegiatan: deskripsiKegiatan,
    tempatKegiatan: tempatKegiatan,
    keberangkatan: keberangkatan,
    kepulangan: kepulangan,
    jumlahPartisipan: jumlahPartisipan,
    bentukPelaksanaanKegiatan: bentukPelaksanaanKegiatan,
    hasilKegiatan: hasilKegiatan,
    pembina: pembina,
    ketuaOrmawa: ketuaOrmawa,
    latarBelakang: latarBelakang,
    waktuDanTempatPelaksanaan: waktuDanTempatPelaksanaan,
    panitiaPesertaL: panitiaPesertaL,
    idRincianBiayaKegiatan: idRincianBiayaKegiatan,
    penutup: penutup,
    idLampiranL: idLampiranL,
    status: status,
    file: file,
    updatedAt: updatedAt,
    createdAt: createdAt,
    updatedBy: updatedBy,
  );

  factory LaporanModel.fromJson(Map<String, dynamic> json) {
    return LaporanModel(
      idLaporan: json['idLaporan'],
      idOrmawa: json['idOrmawa'],
      idUser: json['idUser'],
      idUsulan: json['idUsulan'],
      namaKegiatan: json['namaKegiatan'],
      bentuk: json['bentuk'],
      hasilK: json['hasilK'],
      totalDana: json['totalDana'],
      sumberDana: json['sumberDana'],
      deskripsiKegiatan: json['deskripsiKegiatan'],
      tempatKegiatan: json['tempatKegiatan'],
      keberangkatan: json['keberangkatan'],
      kepulangan: json['kepulangan'],
      jumlahPartisipan: json['jumlahPartisipan'],
      bentukPelaksanaanKegiatan: json['bentukPelaksanaanKegiatan'],
      hasilKegiatan: json['hasilKegiatan'],
      pembina: json['pembina'],
      ketuaOrmawa: json['ketuaOrmawa'],
      latarBelakang: json['latarBelakang'],
      waktuDanTempatPelaksanaan: json['waktuDanTempatPelaksanaan'],
      panitiaPesertaL: json['panitiaPesertaL'],
      idRincianBiayaKegiatan: json['idRincianBiayaKegiatan'],
      penutup: json['penutup'],
      idLampiranL: json['idLampiranL'],
      status: json['status'],
      file: json['file'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      updatedBy: json['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idLaporan': idLaporan,
      'idOrmawa': idOrmawa,
      'idUser': idUser,
      'idUsulan': idUsulan,
      'namaKegiatan': namaKegiatan,
      'bentuk': bentuk,
      'hasilK': hasilK,
      'totalDana': totalDana,
      'sumberDana': sumberDana,
      'deskripsiKegiatan': deskripsiKegiatan,
      'tempatKegiatan': tempatKegiatan,
      'keberangkatan': keberangkatan,
      'kepulangan': kepulangan,
      'jumlahPartisipan': jumlahPartisipan,
      'bentukPelaksanaanKegiatan': bentukPelaksanaanKegiatan,
      'hasilKegiatan': hasilKegiatan,
      'pembina': pembina,
      'ketuaOrmawa': ketuaOrmawa,
      'latarBelakang': latarBelakang,
      'waktuDanTempatPelaksanaan': waktuDanTempatPelaksanaan,
      'panitiaPesertaL': panitiaPesertaL,
      'idRincianBiayaKegiatan': idRincianBiayaKegiatan,
      'penutup': penutup,
      'idLampiranL': idLampiranL,
      'status': status,
      'file': file,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
    };
  }
}
