part of 'lampiran_bloc.dart';

abstract class LampiranState extends Equatable {
  const LampiranState();

  @override
  List<Object> get props => [];
}

class LampiranEmpty extends LampiranState {}

class LampiranLoading extends LampiranState {}

class LampiranError extends LampiranState {
  final String message;

  const LampiranError({required this.message});

  @override
  List<Object> get props => [message];
}

class LampiranHasData extends LampiranState {
  const LampiranHasData({required this.lampiranList});

  final List<Lampiran> lampiranList;

  @override
  List<Object> get props => [lampiranList];
}

class LampiranSuccessMessage extends LampiranState {
  const LampiranSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
