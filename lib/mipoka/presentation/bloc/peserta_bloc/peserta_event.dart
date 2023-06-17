part of 'peserta_bloc.dart';

abstract class PesertaEvent extends Equatable {
  const PesertaEvent();

  @override
  List<Object> get props => [];
}

class ReadPesertaEvent extends PesertaEvent {}

class CreatePesertaEvent extends PesertaEvent {
  final Peserta peserta;

  const CreatePesertaEvent(this.peserta);

  @override
  List<Object> get props => [peserta];
}

class UpdatePesertaEvent extends PesertaEvent {
  final Peserta peserta;

  const UpdatePesertaEvent(this.peserta);

  @override
  List<Object> get props => [peserta];
}

class DeletePesertaEvent extends PesertaEvent {
  final int idPeserta;

  const DeletePesertaEvent(this.idPeserta);

  @override
  List<Object> get props => [idPeserta];
}
