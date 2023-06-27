import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/use_cases/mipoka_user_use_case.dart';

part 'mipoka_user_event.dart';
part 'mipoka_user_state.dart';

class MipokaUserBloc extends Bloc<MipokaUserEvent, MipokaUserState> {
  final MipokaUserUseCase mipokaUserUseCase;

  MipokaUserBloc({required this.mipokaUserUseCase}) : super(MipokaUserEmpty()) {

    on<ReadAllMipokaUserEvent>((event, emit) async {
      emit(MipokaUserLoading());

      final result = await mipokaUserUseCase.readAllMipokaUser();

      result.fold(
            (failure) => emit(MipokaUserError(message: failure.message)),
            (mipokaUserList) => emit(AllMipokaUserHasData(mipokaUserList: mipokaUserList)),
      );
    });

    on<ReadMipokaUserEvent>((event, emit) async {
      emit(MipokaUserLoading());

      final result = await mipokaUserUseCase.readMipokaUser(event.idMipokaUser);

      result.fold(
            (failure) => emit(MipokaUserError(message: failure.message)),
            (mipokaUser) => emit(MipokaUserHasData(mipokaUser: mipokaUser)),
      );
    });

    on<CreateMipokaUserEvent>((event, emit) async {
      emit(MipokaUserLoading());

      final result = await mipokaUserUseCase.createMipokaUser(event.mipokaUser);

      result.fold(
            (failure) => emit(MipokaUserError(message: failure.message)),
            (message) => emit(MipokaUserSuccessMessage(message: message)),
      );
    });

    on<UpdateMipokaUserEvent>((event, emit) async {
      emit(MipokaUserLoading());

      final result = await mipokaUserUseCase.updateMipokaUser(event.mipokaUser);

      result.fold(
            (failure) => emit(MipokaUserError(message: failure.message)),
            (message) => emit(MipokaUserSuccessMessage(message: message)),
      );
    });

    on<DeleteMipokaUserEvent>((event, emit) async {
      emit(MipokaUserLoading());

      final result = await mipokaUserUseCase.deleteMipokaUser(event.idMipokaUser);

      result.fold(
            (failure) => emit(MipokaUserError(message: failure.message)),
            (message) => emit(MipokaUserSuccessMessage(message: message)),
      );
    });
  }
}

