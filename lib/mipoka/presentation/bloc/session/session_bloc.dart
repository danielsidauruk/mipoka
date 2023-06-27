import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/domain/use_cases/session_use_case.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionUseCase sessionUseCase;

  SessionBloc({required this.sessionUseCase}) : super(SessionEmpty()) {
    on<ReadSessionEvent>((event, emit) async {
      emit(SessionLoading());

      final result = await sessionUseCase.readAllSession();

      result.fold(
            (failure) => emit(SessionError(message: failure.message)),
            (sessionList) => emit(SessionHasData(sessionList: sessionList)),
      );
    });

    on<CreateSessionEvent>((event, emit) async {
      emit(SessionLoading());

      final result = await sessionUseCase.createSession(event.session);

      result.fold(
            (failure) => emit(SessionError(message: failure.message)),
            (message) => emit(SessionSuccessMessage(message: message)),
      );

      add(ReadSessionEvent());
    });

    on<UpdateSessionEvent>((event, emit) async {
      emit(SessionLoading());

      final result = await sessionUseCase.updateSession(event.session);

      result.fold(
            (failure) => emit(SessionError(message: failure.message)),
            (message) => emit(SessionSuccessMessage(message: message)),
      );

      add(ReadSessionEvent());
    });

    on<DeleteSessionEvent>((event, emit) async {
      emit(SessionLoading());

      final result = await sessionUseCase.deleteSession(event.idSession);

      result.fold(
            (failure) => emit(SessionError(message: failure.message)),
            (message) => emit(SessionSuccessMessage(message: message)),
      );

      add(ReadSessionEvent());
    });
  }
}
