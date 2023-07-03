import 'package:equatable/equatable.dart';

class KegiatanPerPeriodeMpt extends Equatable{
  final int idKegiatanPerPeriodeMpt;
  final int idPeriodeMpt;
  final int idNamaKegiatanMpt;
  final int idJenisKegiatanMpt;
  final String tanggalMulaiKegiatanPerPeriodeMpt;
  final String tanggalSelesaiKegiatanPerPeriodeMpt;
  final int pointMptDiperoleh;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const KegiatanPerPeriodeMpt({
    required this.idKegiatanPerPeriodeMpt,
    required this.idNamaKegiatanMpt,
    required this.idPeriodeMpt,
    required this.idJenisKegiatanMpt,
    required this.tanggalMulaiKegiatanPerPeriodeMpt,
    required this.tanggalSelesaiKegiatanPerPeriodeMpt,
    required this.pointMptDiperoleh,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  KegiatanPerPeriodeMpt copyWith({
    int? idKegiatanPerPeriodeMpt,
    int? idPeriodeMpt,
    int? idNamaKegiatanMpt,
    int? idJenisKegiatanMpt,
    String? tanggalMulaiKegiatanPerPeriodeMpt,
    String? tanggalSelesaiKegiatanPerPeriodeMpt,
    int? pointMptDiperoleh,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      KegiatanPerPeriodeMpt(
        idKegiatanPerPeriodeMpt: idKegiatanPerPeriodeMpt ?? this.idKegiatanPerPeriodeMpt,
        idPeriodeMpt: idPeriodeMpt ?? this.idPeriodeMpt,
        idNamaKegiatanMpt: idNamaKegiatanMpt ?? this.idNamaKegiatanMpt,
        idJenisKegiatanMpt: idJenisKegiatanMpt ?? this.idJenisKegiatanMpt,
        tanggalMulaiKegiatanPerPeriodeMpt: tanggalMulaiKegiatanPerPeriodeMpt ?? this.tanggalMulaiKegiatanPerPeriodeMpt,
        tanggalSelesaiKegiatanPerPeriodeMpt: tanggalSelesaiKegiatanPerPeriodeMpt ?? this.tanggalSelesaiKegiatanPerPeriodeMpt,
        pointMptDiperoleh: pointMptDiperoleh ?? this.pointMptDiperoleh,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idKegiatanPerPeriodeMpt,
    idNamaKegiatanMpt,
    idPeriodeMpt,
    tanggalMulaiKegiatanPerPeriodeMpt,
    tanggalSelesaiKegiatanPerPeriodeMpt,
    pointMptDiperoleh,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
