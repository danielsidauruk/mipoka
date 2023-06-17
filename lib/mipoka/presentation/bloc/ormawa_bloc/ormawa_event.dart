part of 'ormawa_bloc.dart';

abstract class OrmawaEvent extends Equatable {
  const OrmawaEvent();

  @override
  List<Object?> get props => [];
}

class CreateOrmawaEvent extends OrmawaEvent {
  final Ormawa ormawa;

  const CreateOrmawaEvent(this.ormawa);

  @override
  List<Object?> get props => [ormawa];
}

class ReadOrmawaEvent extends OrmawaEvent {}

class UpdateOrmawaEvent extends OrmawaEvent {
  final Ormawa ormawa;

  const UpdateOrmawaEvent(this.ormawa);

  @override
  List<Object?> get props => [ormawa];
}

class DeleteOrmawaEvent extends OrmawaEvent {
  final int idOrmawa;

  const DeleteOrmawaEvent(this.idOrmawa);

  @override
  List<Object?> get props => [idOrmawa];
}
