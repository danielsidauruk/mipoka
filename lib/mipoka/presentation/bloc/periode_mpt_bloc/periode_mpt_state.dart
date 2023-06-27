part of 'periode_mpt_bloc.dart';

abstract class PeriodeMptState extends Equatable {
  const PeriodeMptState();

  @override
  List<Object> get props => [];
}

class PeriodeMptEmpty extends PeriodeMptState {}

class PeriodeMptLoading extends PeriodeMptState {}

class PeriodeMptHasData extends PeriodeMptState {
  final List<PeriodeMpt> periodeMptList;

  const PeriodeMptHasData({required this.periodeMptList});

  @override
  List<Object> get props => [periodeMptList];
}

class PeriodeMptSuccessMessage extends PeriodeMptState {
  final String message;

  const PeriodeMptSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class PeriodeMptError extends PeriodeMptState {
  final String message;

  const PeriodeMptError({required this.message});

  @override
  List<Object> get props => [message];
}
