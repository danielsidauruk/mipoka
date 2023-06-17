part of 'prestasi_bloc.dart';

abstract class PrestasiEvent extends Equatable {
  const PrestasiEvent();

  @override
  List<Object> get props => [];
}

class ReadPrestasiEvent extends PrestasiEvent {}

class CreatePrestasiEvent extends PrestasiEvent {
  final Prestasi prestasi;

  const CreatePrestasiEvent(this.prestasi);

  @override
  List<Object> get props => [prestasi];
}

class UpdatePrestasiEvent extends PrestasiEvent {
  final Prestasi prestasi;

  const UpdatePrestasiEvent(this.prestasi);

  @override
  List<Object> get props => [prestasi];
}

class DeletePrestasiEvent extends PrestasiEvent {
  final int idPrestasi;

  const DeletePrestasiEvent(this.idPrestasi);

  @override
  List<Object> get props => [idPrestasi];
}
