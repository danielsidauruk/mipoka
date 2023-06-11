import 'package:equatable/equatable.dart';

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
