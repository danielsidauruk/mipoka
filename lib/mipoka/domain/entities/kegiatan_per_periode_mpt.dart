import 'package:equatable/equatable.dart';

class KegiatanPerPeriodeMpt extends Equatable{
  final int idKegiatanPerPeriodeMpt;
  final int idPeriodeMpt;
  final int idNamaKegiatanMpt;
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
    String? tanggalMulaiKegiatanMpt,
    String? tanggalSelesaiKegiatanMpt,
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
        tanggalMulaiKegiatanPerPeriodeMpt: tanggalMulaiKegiatanMpt ?? this.tanggalMulaiKegiatanPerPeriodeMpt,
        tanggalSelesaiKegiatanPerPeriodeMpt: tanggalSelesaiKegiatanMpt ?? this.tanggalSelesaiKegiatanPerPeriodeMpt,
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
