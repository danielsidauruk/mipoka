part of 'mipoka_user_bloc.dart';

abstract class MipokaUserState extends Equatable {
  const MipokaUserState();

  @override
  List<Object> get props => [];
}

class MipokaUserEmpty extends MipokaUserState {}

class MipokaUserLoading extends MipokaUserState {}

class AllMipokaUserHasData extends MipokaUserState {
  final List<MipokaUser> mipokaUserList;

  const AllMipokaUserHasData({required this.mipokaUserList});

  @override
  List<Object> get props => [mipokaUserList];
}

class MipokaUserHasData extends MipokaUserState {
  final MipokaUser mipokaUser;

  const MipokaUserHasData({required this.mipokaUser});

  @override
  List<Object> get props => [mipokaUser];
}

class MipokaUserError extends MipokaUserState {
  final String message;

  const MipokaUserError({required this.message});

  @override
  List<Object> get props => [message];
}

class MipokaUserSuccessMessage extends MipokaUserState {
  final String message;

  const MipokaUserSuccessMessage({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}
