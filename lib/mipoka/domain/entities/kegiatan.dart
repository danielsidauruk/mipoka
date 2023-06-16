import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/kegiatan_model.dart';

class Kegiatan extends Equatable {
  final int idKegiatan;
  final String jenisKegiatan;
  final String namaKegiatan;
  final String idPeriode;
  final int pointMpt;
  final int idOrmawa;
  final String keterangan;

  const Kegiatan({
    required this.idKegiatan,
    required this.jenisKegiatan,
    required this.namaKegiatan,
    required this.idPeriode,
    required this.pointMpt,
    required this.idOrmawa,
    required this.keterangan,
  });

  Kegiatan updateWith({
    int? idKegiatan,
    String? jenisKegiatan,
    String? namaKegiatan,
    String? idPeriode,
    int? pointMpt,
    int? idOrmawa,
    String? keterangan,
  }) {
    return Kegiatan(
      idKegiatan: idKegiatan ?? this.idKegiatan,
      jenisKegiatan: jenisKegiatan ?? this.jenisKegiatan,
      namaKegiatan: namaKegiatan ?? this.namaKegiatan,
      idPeriode: idPeriode ?? this.idPeriode,
      pointMpt: pointMpt ?? this.pointMpt,
      idOrmawa: idOrmawa ?? this.idOrmawa,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  @override
  List<Object?> get props => [
    idKegiatan,
    jenisKegiatan,
    namaKegiatan,
    idPeriode,
    pointMpt,
    idOrmawa,
    keterangan,
  ];
}
