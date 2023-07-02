part of 'mhs_per_periode_mpt_use_cases_bloc.dart';

abstract class MhsPerPeriodeMptEvent extends Equatable {
  const MhsPerPeriodeMptEvent();

  @override
  List<Object?> get props => [];
}

class CreateMhsPerPeriodeMptEvent extends MhsPerPeriodeMptEvent {
  final MhsPerPeriodeMpt mhsPerPeriodeMpt;

  const CreateMhsPerPeriodeMptEvent({required this.mhsPerPeriodeMpt});

  @override
  List<Object?> get props => [mhsPerPeriodeMpt];
}

class ReadAllMhsPerPeriodeMptEvent extends MhsPerPeriodeMptEvent {
  final String filter;

  const ReadAllMhsPerPeriodeMptEvent({this.filter = "Semua"});

  @override
  List<Object?> get props => [filter];
}

class ReadMhsPerPeriodeMptEvent extends MhsPerPeriodeMptEvent {
  final int idMhsPerPeriodeMpt;

  const ReadMhsPerPeriodeMptEvent({required this.idMhsPerPeriodeMpt});
}

class UpdateMhsPerPeriodeMptEvent extends MhsPerPeriodeMptEvent {
  final MhsPerPeriodeMpt mhsPerPeriodeMpt;

  const UpdateMhsPerPeriodeMptEvent({required this.mhsPerPeriodeMpt});

  @override
  List<Object?> get props => [mhsPerPeriodeMpt];
}

class DeleteMhsPerPeriodeMptEvent extends MhsPerPeriodeMptEvent {
  final int idMhsPerPeriodeMpt;

  const DeleteMhsPerPeriodeMptEvent({required this.idMhsPerPeriodeMpt});

  @override
  List<Object?> get props => [idMhsPerPeriodeMpt];
}