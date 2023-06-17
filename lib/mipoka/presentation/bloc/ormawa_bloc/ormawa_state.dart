part of 'ormawa_bloc.dart';

abstract class OrmawaState extends Equatable {
  const OrmawaState();

  @override
  List<Object> get props => [];
}

class OrmawaEmpty extends OrmawaState {}

class OrmawaLoading extends OrmawaState {}

class OrmawaError extends OrmawaState {
  final String message;

  const OrmawaError({required this.message});

  @override
  List<Object> get props => [message];
}

class OrmawaHasData extends OrmawaState {
  const OrmawaHasData({required this.ormawaList});

  final List<Ormawa> ormawaList;

  @override
  List<Object> get props => [ormawaList];
}

class OrmawaSuccessMessage extends OrmawaState {
  const OrmawaSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
