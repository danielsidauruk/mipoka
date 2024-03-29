import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';

class KegiatanPerPeriodeMpt extends Equatable{
  final int idKegiatanPerPeriodeMpt;
  final PeriodeMpt periodeMpt;
  final NamaKegiatanMpt namaKegiatanMpt;
  final String tanggalMulaiKegiatanPerPeriodeMpt;
  final String tanggalSelesaiKegiatanPerPeriodeMpt;
  final int pointMptDiperoleh;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const KegiatanPerPeriodeMpt({
    required this.idKegiatanPerPeriodeMpt,
    required this.periodeMpt,
    required this.namaKegiatanMpt,
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
    PeriodeMpt? periodeMpt,
    NamaKegiatanMpt? namaKegiatanMpt,
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
        periodeMpt: periodeMpt ?? this.periodeMpt,
        namaKegiatanMpt: namaKegiatanMpt ?? this.namaKegiatanMpt,
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
    namaKegiatanMpt,
    periodeMpt,
    tanggalMulaiKegiatanPerPeriodeMpt,
    tanggalSelesaiKegiatanPerPeriodeMpt,
    pointMptDiperoleh,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
