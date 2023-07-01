import 'package:equatable/equatable.dart';

class PeriodeMpt extends Equatable{
  final int idPeriodeMpt;
  final String tahunPeriodeMpt;
  final bool periodeMengulangMpt;
  final String tanggalMulaiPeriodeMpt;
  final String tanggalBerakhirPeriodeMpt;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const PeriodeMpt({
    required this.idPeriodeMpt,
    required this.tahunPeriodeMpt,
    required this.periodeMengulangMpt,
    required this.tanggalMulaiPeriodeMpt,
    required this.tanggalBerakhirPeriodeMpt,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  PeriodeMpt copyWith({
    int? idPeriodeMpt,
    String? tahunPeriodeMpt,
    bool? periodeMengulangMpt,
    String? tanggalMulaiPeriodeMpt,
    String? tanggalBerakhirPeriodeMpt,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      PeriodeMpt(
        idPeriodeMpt: idPeriodeMpt ?? this.idPeriodeMpt,
        tahunPeriodeMpt: tahunPeriodeMpt ?? this.tahunPeriodeMpt,
        periodeMengulangMpt: periodeMengulangMpt ?? this.periodeMengulangMpt,
        tanggalMulaiPeriodeMpt: tanggalMulaiPeriodeMpt ?? this.tanggalMulaiPeriodeMpt,
        tanggalBerakhirPeriodeMpt: tanggalBerakhirPeriodeMpt ?? this.tanggalBerakhirPeriodeMpt,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idPeriodeMpt,
    tahunPeriodeMpt,
    periodeMengulangMpt,
    tanggalMulaiPeriodeMpt,
    tanggalBerakhirPeriodeMpt,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
