import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/use_cases/mipoka_user_use_case.dart';

part 'mipoka_user_by_nim_event.dart';
part 'mipoka_user_by_nim_state.dart';

class MipokaUserByNimBloc extends Bloc<MipokaUserByNimEvent, MipokaUserByNimState> {
  final MipokaUserUseCase mipokaUserUseCase;


  MipokaUserByNimBloc({required this.mipokaUserUseCase}) : super(MipokaUserByNimEmpty()) {
    on<ReadMipokaUserByNimEvent>((event, emit) async {
      emit(MipokaUserByNimLoading());

      final result = await mipokaUserUseCase.readMipokaUserByNim(event.nim);

      result.fold(
            (failure) => emit(MipokaUserByNimError(message: failure.message)),
            (mipokaUser) => emit(MipokaUserByNimByNimHasData(mipokaUser: mipokaUser)),
      );
    });
  }

}
