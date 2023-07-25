part of 'mhs_per_periode_mpt_use_cases_bloc.dart';

abstract class MhsPerPeriodeMptState extends Equatable {
  const MhsPerPeriodeMptState();

  @override
  List<Object> get props => [];
}

class MhsPerPeriodeMptEmpty extends MhsPerPeriodeMptState {}

class MhsPerPeriodeMptLoading extends MhsPerPeriodeMptState {}

class MhsPerPeriodeMptError extends MhsPerPeriodeMptState {
  final String message;

  const MhsPerPeriodeMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllMhsPerPeriodeMptHasData extends MhsPerPeriodeMptState {
  const AllMhsPerPeriodeMptHasData({required this.mhsPerPeriodeMptList});

  final List<MhsPerPeriodeMpt> mhsPerPeriodeMptList;

  @override
  List<Object> get props => [mhsPerPeriodeMptList];
}

class MhsPerPeriodeMptHasData extends MhsPerPeriodeMptState {
  final MhsPerPeriodeMpt mhsPerPeriodeMpt;

  const MhsPerPeriodeMptHasData({required this.mhsPerPeriodeMpt});

  @override
  List<Object> get props => [mhsPerPeriodeMpt];
}

class MhsPerPeriodeMptSuccess extends MhsPerPeriodeMptState {}