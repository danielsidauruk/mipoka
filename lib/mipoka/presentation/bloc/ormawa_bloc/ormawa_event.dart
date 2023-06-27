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

class ReadAllOrmawaEvent extends OrmawaEvent {}

class ReadOrmawaEvent extends OrmawaEvent {
  final int idOrmawa;

  const ReadOrmawaEvent({required this.idOrmawa});
}

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
