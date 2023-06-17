part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class ReadSessionEvent extends SessionEvent {}

class CreateSessionEvent extends SessionEvent {
  final Session session;

  const CreateSessionEvent({required this.session});

  @override
  List<Object> get props => [session];
}

class UpdateSessionEvent extends SessionEvent {
  final Session session;

  const UpdateSessionEvent({required this.session});

  @override
  List<Object> get props => [session];
}

class DeleteSessionEvent extends SessionEvent {
  final int idSession;

  const DeleteSessionEvent({required this.idSession});

  @override
  List<Object> get props => [idSession];
}
