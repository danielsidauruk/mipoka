import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/domain/use_cases/user_use_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;

  UserBloc({required this.userUseCase}) : super(UserEmpty()) {
    on<ReadUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userUseCase.readUser();

      result.fold(
            (failure) => emit(UserError(message: failure.message)),
            (userList) => emit(UserHasData(userList: userList)),
      );
    });

    on<CreateUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userUseCase.createUser(event.user);

      result.fold(
            (failure) => emit(UserError(message: failure.message)),
            (message) => emit(UserSuccessMessage(message: message)),
      );

      add(ReadUserEvent());
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userUseCase.updateUser(event.user);

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
