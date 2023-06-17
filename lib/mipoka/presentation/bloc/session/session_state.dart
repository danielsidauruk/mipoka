part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionEmpty extends SessionState {}

class SessionLoading extends SessionState {}

class SessionHasData extends SessionState {
  final List<Session> sessionList;

  const SessionHasData({required this.sessionList});

  @override
  List<Object> get props => [sessionList];
}

class SessionError extends SessionState {
  final String message;

  const SessionError({required this.message});

  @override
  List<Object> get props => [message];
}

class SessionSuccessMessage extends SessionState {
  final String message;

  const SessionSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}
