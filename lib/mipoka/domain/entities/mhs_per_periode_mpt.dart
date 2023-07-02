import 'package:equatable/equatable.dart';

class MhsPerPeriodeMpt extends Equatable {
  final int idMhsPerPeriodeMpt;
  final String idUser;
  final int idPeriodeMpt;
  final int idKegiatanPerPeriodeMpt;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const MhsPerPeriodeMpt({
    required this.idMhsPerPeriodeMpt,
    required this.idUser,
    required this.idPeriodeMpt,
    required this.idKegiatanPerPeriodeMpt,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  MhsPerPeriodeMpt copyWith({
    int? idMhsPerPeriodeMpt,
    String? idUser,
    int? idPeriodeMpt,
    int? idKegiatanPerPeriodeMpt,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      MhsPerPeriodeMpt(
        idMhsPerPeriodeMpt: idMhsPerPeriodeMpt ?? this.idMhsPerPeriodeMpt,
        idUser: idUser ?? this.idUser,
        idPeriodeMpt: idPeriodeMpt ?? this.idPeriodeMpt,
        idKegiatanPerPeriodeMpt: idKegiatanPerPeriodeMpt ?? this.idKegiatanPerPeriodeMpt,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idMhsPerPeriodeMpt,
    idUser,
    idPeriodeMpt,
    idKegiatanPerPeriodeMpt,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
