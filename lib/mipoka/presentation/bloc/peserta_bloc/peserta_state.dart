part of 'peserta_bloc.dart';

abstract class PesertaState extends Equatable {
  const PesertaState();

  @override
  List<Object> get props => [];
}

class PesertaEmpty extends PesertaState {}

class PesertaLoading extends PesertaState {}

class PesertaHasData extends PesertaState {
  final List<Peserta> pesertaList;

  const PesertaHasData({required this.pesertaList});

  @override
  List<Object> get props => [pesertaList];
}

class PesertaSuccessMessage extends PesertaState {
  final String message;

  const PesertaSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class PesertaError extends PesertaState {
  final String message;

  const PesertaError({required this.message});

  @override
  List<Object> get props => [message];
}
