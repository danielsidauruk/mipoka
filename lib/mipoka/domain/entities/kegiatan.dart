import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/periode.dart';

// ==> Just Updated
class Kegiatan extends Equatable {
  final int idKegiatan;
  final String jenisKegiatan;
  final String namaKegiatan;
  final Periode periode;
  final int pointMpt;
  final Ormawa ormawa;
  final String keterangan;

  const Kegiatan({
    required this.idKegiatan,
    required this.jenisKegiatan,
    required this.namaKegiatan,
    required this.periode,
    required this.pointMpt,
    required this.ormawa,
    required this.keterangan,
  });

  Kegiatan copyWith({
    int? idKegiatan,
    String? jenisKegiatan,
    String? namaKegiatan,
    Periode? periode,
    int? pointMpt,
    Ormawa? ormawa,
    String? keterangan,
  }) =>
      Kegiatan(
        idKegiatan: idKegiatan ?? this.idKegiatan,
        jenisKegiatan: jenisKegiatan ?? this.jenisKegiatan,
        namaKegiatan: namaKegiatan ?? this.namaKegiatan,
        periode: periode ?? this.periode,
        pointMpt: pointMpt ?? this.pointMpt,
        ormawa: ormawa ?? this.ormawa,
        keterangan: keterangan ?? this.keterangan,
      );

  @override
  List<Object?> get props => [
    idKegiatan,
    jenisKegiatan,
    namaKegiatan,
    periode,
    pointMpt,
    ormawa,
    keterangan,
  ];
}