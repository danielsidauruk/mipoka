part of 'lampiran_bloc.dart';

abstract class LampiranEvent extends Equatable {
  const LampiranEvent();

  @override
  List<Object?> get props => [];
}

class CreateLampiranEvent extends LampiranEvent {
  final Lampiran lampiran;

  const CreateLampiranEvent(this.lampiran);

  @override
  List<Object?> get props => [lampiran];
}

class ReadLampiranEvent extends LampiranEvent {}

class UpdateLampiranEvent extends LampiranEvent {
  final Lampiran lampiran;

  const UpdateLampiranEvent(this.lampiran);

  @override
  List<Object?> get props => [lampiran];
}

class DeleteLampiranEvent extends LampiranEvent {
  final int idLampiran;

  const DeleteLampiranEvent(this.idLampiran);

  @override
  List<Object?> get props => [idLampiran];
}
