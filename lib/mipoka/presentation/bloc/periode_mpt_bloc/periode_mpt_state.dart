part of 'periode_mpt_bloc.dart';

abstract class PeriodeMptState extends Equatable {
  const PeriodeMptState();

  @override
  List<Object> get props => [];
}

class PeriodeMptEmpty extends PeriodeMptState {}

class PeriodeMptLoading extends PeriodeMptState {}

class AllPeriodeMptHasData extends PeriodeMptState {
  final List<PeriodeMpt> periodeMptList;

  const AllPeriodeMptHasData({required this.periodeMptList});

  @override
  List<Object> get props => [periodeMptList];
}

class PeriodeMptHasData extends PeriodeMptState {
  final PeriodeMpt periodeMpt;

  const PeriodeMptHasData({required this.periodeMpt});

  @override
  List<Object> get props => [periodeMpt];
}

class PeriodeMptSuccessMessage extends PeriodeMptState {
  final String message;

  const PeriodeMptSuccessMessage({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}

class PeriodeMptError extends PeriodeMptState {
  final String message;

  const PeriodeMptError({required this.message});

  @override
  List<Object> get props => [message];
}
