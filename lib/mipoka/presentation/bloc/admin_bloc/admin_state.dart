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
  const AdminHasData({required this.admin});

  final Admin admin;

  @override
  List<Object> get props => [admin];
}

class AdminSuccessMessage extends AdminState {
  const AdminSuccessMessage({this.message = "Data has changed"});

  final String message;

  @override
  List<Object> get props => [message];
}

