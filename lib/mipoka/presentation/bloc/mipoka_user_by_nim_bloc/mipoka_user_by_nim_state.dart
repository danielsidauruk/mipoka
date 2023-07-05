part of 'mipoka_user_by_nim_bloc.dart';

abstract class MipokaUserByNimState extends Equatable {
  const MipokaUserByNimState();

  @override
  List<Object> get props => [];
}

class MipokaUserByNimEmpty extends MipokaUserByNimState {}

class MipokaUserByNimLoading extends MipokaUserByNimState {}

class MipokaUserByNimByNimHasData extends MipokaUserByNimState {
  final MipokaUser mipokaUser;

  const MipokaUserByNimByNimHasData({required this.mipokaUser});

  @override
  List<Object> get props => [mipokaUser];
}

class MipokaUserByNimError extends MipokaUserByNimState {
  final String message;

  const MipokaUserByNimError({required this.message});

  @override
  List<Object> get props => [message];
}
