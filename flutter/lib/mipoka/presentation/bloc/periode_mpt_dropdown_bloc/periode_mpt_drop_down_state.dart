part of 'periode_mpt_drop_down_bloc.dart';

abstract class PeriodeMptDropDownState extends Equatable {
  const PeriodeMptDropDownState();

  @override
  List<Object> get props => [];
}

class PeriodeMptDropDownEmpty extends PeriodeMptDropDownState {}

class PeriodeMptDropDownLoading extends PeriodeMptDropDownState {}

class PeriodeMptDropDownHasData extends PeriodeMptDropDownState {
  final List<PeriodeMpt> periodeMptList;

  const PeriodeMptDropDownHasData({required this.periodeMptList});

  @override
  List<Object> get props => [periodeMptList];
}

class PeriodeMptDropDownError extends PeriodeMptDropDownState {
  final String message;

  const PeriodeMptDropDownError({required this.message});

  @override
  List<Object> get props => [message];
}
