import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/use_cases/mipoka_user_use_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final MipokaUserUseCase userUseCase;

  UserBloc({required this.userUseCase}) : super(UserEmpty()) {
    on<ReadUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userUseCase.readAllMipokaUser();

      result.fold(
            (failure) => emit(UserError(message: failure.message)),
            (userList) => emit(UserHasData(userList: userList)),
      );
    });

    on<CreateUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userUseCase.createMipokaUser(event.mipokaUser);

      result.fold(
            (failure) => emit(UserError(message: failure.message)),
            (message) => emit(UserSuccessMessage(message: message)),
      );

      add(ReadUserEvent());
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userUseCase.updateMipokaUser(event.user);

      result.fold(
            (failure) => emit(UserError(message: failure.message)),
            (message) => emit(UserSuccessMessage(message: message)),
      );

      add(ReadUserEvent());
    });

    on<DeleteUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userUseCase.deleteUser(event.idUser);

      result.fold(
            (failure) => emit(UserError(message: failure.message)),
            (message) => emit(UserSuccessMessage(message: message)),
      );

      add(ReadUserEvent());
    });
  }
}
