part of 'tertib_acara_bloc.dart';

abstract class TertibAcaraState extends Equatable {
  const TertibAcaraState();

  @override
  List<Object> get props => [];
}

class TertibAcaraEmpty extends TertibAcaraState {}

class TertibAcaraLoading extends TertibAcaraState {}

class TertibAcaraHasData extends TertibAcaraState {
  final TertibAcara tertibAcara;

  const TertibAcaraHasData({required this.tertibAcara});

  @override
  List<Object> get props => [tertibAcara];
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
