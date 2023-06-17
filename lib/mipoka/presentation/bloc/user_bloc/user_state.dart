part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserEmpty extends UserState {}

class UserLoading extends UserState {}

class UserHasData extends UserState {
  final List<User> userList;

  const UserHasData({required this.userList});

  @override
  List<Object> get props => [userList];
}

class UserError extends UserState {
  final String message;

  const UserError({required this.message});

  @override
  List<Object> get props => [message];
}

class UserSuccessMessage extends UserState {
  final String message;

  const UserSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}
