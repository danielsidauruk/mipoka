part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionEmpty extends SessionState {}

class SessionLoading extends SessionState {}

class AllSessionHasData extends SessionState {
  final List<Session> sessionList;

  const AllSessionHasData({required this.sessionList});

  @override
  List<Object> get props => [sessionList];
}

class SessionHasData extends SessionState {
  final Session session;

  const SessionHasData({required this.session});

  @override
  List<Object> get props => [session];
}

class SessionError extends SessionState {
  final String message;

  const SessionError({required this.message});

  @override
  List<Object> get props => [message];
}

class SessionSuccessMessage extends SessionState {
  final String message;

  const SessionSuccessMessage({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}
