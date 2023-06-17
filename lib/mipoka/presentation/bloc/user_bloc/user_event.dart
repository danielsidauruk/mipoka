part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class ReadUserEvent extends UserEvent {}

class CreateUserEvent extends UserEvent {
  final User user;

  const CreateUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class UpdateUserEvent extends UserEvent {
  final User user;

  const UpdateUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class DeleteUserEvent extends UserEvent {
  final int idUser;

  const DeleteUserEvent({required this.idUser});

  @override
  List<Object> get props => [idUser];
}
