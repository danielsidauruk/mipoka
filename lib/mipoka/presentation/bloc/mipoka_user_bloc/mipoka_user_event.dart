part of 'mipoka_user_bloc.dart';

abstract class MipokaUserEvent extends Equatable {
  const MipokaUserEvent();

  @override
  List<Object> get props => [];
}

class ReadAllMipokaUserEvent extends MipokaUserEvent {}

class ReadMipokaUserEvent extends MipokaUserEvent {
  final String idMipokaUser;

  const ReadMipokaUserEvent({required this.idMipokaUser});
}

class CreateMipokaUserEvent extends MipokaUserEvent {
  final MipokaUser mipokaUser;

  const CreateMipokaUserEvent({required this.mipokaUser});

  @override
  List<Object> get props => [mipokaUser];
}

class UpdateMipokaUserEvent extends MipokaUserEvent {
  final MipokaUser mipokaUser;

  const UpdateMipokaUserEvent({required this.mipokaUser});

  @override
  List<Object> get props => [mipokaUser];
}

class DeleteMipokaUserEvent extends MipokaUserEvent {
  final String idMipokaUser;

  const DeleteMipokaUserEvent({required this.idMipokaUser});

  @override
  List<Object> get props => [idMipokaUser];
}
