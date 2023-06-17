part of 'tertib_acara_bloc.dart';

abstract class TertibAcaraState extends Equatable {
  const TertibAcaraState();

  @override
  List<Object> get props => [];
}

class TertibAcaraEmpty extends TertibAcaraState {}

class TertibAcaraLoading extends TertibAcaraState {}

class TertibAcaraHasData extends TertibAcaraState {
  final List<TertibAcara> tertibAcaraList;

  const TertibAcaraHasData({required this.tertibAcaraList});

  @override
  List<Object> get props => [tertibAcaraList];
}

class TertibAcaraError extends TertibAcaraState {
  final String message;

  const TertibAcaraError({required this.message});

  @override
  List<Object> get props => [message];
}

class TertibAcaraSuccessMessage extends TertibAcaraState {
  final String message;

  const TertibAcaraSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}
