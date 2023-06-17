part of 'periode_bloc.dart';

abstract class PeriodeState extends Equatable {
  const PeriodeState();

  @override
  List<Object> get props => [];
}

class PeriodeEmpty extends PeriodeState {}

class PeriodeLoading extends PeriodeState {}

class PeriodeHasData extends PeriodeState {
  final List<Periode> periodeList;

  const PeriodeHasData({required this.periodeList});

  @override
  List<Object> get props => [periodeList];
}

class PeriodeSuccessMessage extends PeriodeState {
  final String message;

  const PeriodeSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class PeriodeError extends PeriodeState {
  final String message;

  const PeriodeError({required this.message});

  @override
  List<Object> get props => [message];
}
