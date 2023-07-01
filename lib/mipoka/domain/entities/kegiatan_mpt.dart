import 'package:equatable/equatable.dart';
// ==> Just Updated 26 / 06 / 2023

class KegiatanMpt extends Equatable{
  final int idKegiatanMpt;
  final int idJenisKegiatanMpt;
  final String namaKegiatanMpt;
  final int idPeriodeMpt;
  final String tanggalMulaiKegiatanMpt;
  final String tanggalSelesaiKegiatanMpt;
  final int pointMptDiperoleh;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const KegiatanMpt({
    required this.idKegiatanMpt,
    required this.idJenisKegiatanMpt,
    required this.namaKegiatanMpt,
    required this.idPeriodeMpt,
    required this.tanggalMulaiKegiatanMpt,
    required this.tanggalSelesaiKegiatanMpt,
    required this.pointMptDiperoleh,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  KegiatanMpt copyWith({
    int? idKegiatanMpt,
    int? idJenisKegiatanMpt,
    String? namaKegiatanMpt,
    int? idPeriodeMpt,
    String? tanggalMulaiKegiatanMpt,
    String? tanggalSelesaiKegiatanMpt,
    int? pointMptDiperoleh,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      KegiatanMpt(
        idKegiatanMpt: idKegiatanMpt ?? this.idKegiatanMpt,
        idJenisKegiatanMpt: idJenisKegiatanMpt ?? this.idJenisKegiatanMpt,
        namaKegiatanMpt: namaKegiatanMpt ?? this.namaKegiatanMpt,
        idPeriodeMpt: idPeriodeMpt ?? this.idPeriodeMpt,
        tanggalMulaiKegiatanMpt: tanggalMulaiKegiatanMpt ?? this.tanggalMulaiKegiatanMpt,
        tanggalSelesaiKegiatanMpt: tanggalSelesaiKegiatanMpt ?? this.tanggalSelesaiKegiatanMpt,
        pointMptDiperoleh: pointMptDiperoleh ?? this.pointMptDiperoleh,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idKegiatanMpt,
    idJenisKegiatanMpt,
    namaKegiatanMpt,
    idPeriodeMpt,
    tanggalMulaiKegiatanMpt,
    tanggalSelesaiKegiatanMpt,
    pointMptDiperoleh,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
