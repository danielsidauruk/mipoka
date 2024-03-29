import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';

class MhsPerPeriodeMpt extends Equatable {
  final int idMhsPerPeriodeMpt;
  final MipokaUser mipokaUser;
  final PeriodeMpt periodeMpt;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const MhsPerPeriodeMpt({
    required this.idMhsPerPeriodeMpt,
    required this.mipokaUser,
    required this.periodeMpt,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  MhsPerPeriodeMpt copyWith({
    int? idMhsPerPeriodeMpt,
    MipokaUser? mipokaUser,
    PeriodeMpt? periodeMpt,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      MhsPerPeriodeMpt(
        idMhsPerPeriodeMpt: idMhsPerPeriodeMpt ?? this.idMhsPerPeriodeMpt,
        mipokaUser: mipokaUser ?? this.mipokaUser,
        periodeMpt: periodeMpt ?? this.periodeMpt,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idMhsPerPeriodeMpt,
    mipokaUser,
    periodeMpt,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
