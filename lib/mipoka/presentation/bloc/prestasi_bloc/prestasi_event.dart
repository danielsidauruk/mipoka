part of 'prestasi_bloc.dart';

abstract class PrestasiEvent extends Equatable {
  const PrestasiEvent();

  @override
  List<Object> get props => [];
}

class ReadAllPrestasiEvent extends PrestasiEvent {}

class ReadPrestasiEvent extends PrestasiEvent {
  final int idPrestasi;

  const ReadPrestasiEvent({required this.idPrestasi});
}

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
