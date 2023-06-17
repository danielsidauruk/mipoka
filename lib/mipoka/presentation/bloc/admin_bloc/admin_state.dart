part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminEmpty extends AdminState {}

class AdminLoading extends AdminState {}

class AdminError extends AdminState {
  final String message;

  const AdminError({required this.message});

  @override
  List<Object> get props => [message];
}

class AdminHasData extends AdminState {
  const AdminHasData({required this.adminList});

  final List<Admin> adminList;

  @override
  List<Object> get props => [adminList];
}

class AdminSuccessMessage extends AdminState {
  const AdminSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

