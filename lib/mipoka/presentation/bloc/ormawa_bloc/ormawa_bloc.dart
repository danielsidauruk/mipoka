import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/use_cases/ormawa_use_case.dart';

part 'ormawa_event.dart';
part 'ormawa_state.dart';

class OrmawaBloc extends Bloc<OrmawaEvent, OrmawaState> {
  final OrmawaUseCase ormawaUseCase;

  OrmawaBloc({required this.ormawaUseCase}) : super(OrmawaEmpty()) {
    on<CreateOrmawaEvent>((event, emit) async {
      emit(OrmawaLoading());

      final result = await ormawaUseCase.createOrmawa(event.ormawa);

      result.fold(
            (failure) => emit(OrmawaError(message: failure.message)),
            (message) => emit(OrmawaSuccessMessage(message: message)),
      );
    });

    on<ReadAllOrmawaEvent>((event, emit) async {
      emit(OrmawaLoading());

      final result = await ormawaUseCase.readAllOrmawa();

      result.fold(
            (failure) => emit(OrmawaError(message: failure.message)),
            (ormawaList) => emit(AllOrmawaHasData(ormawaList: ormawaList)),
      );
    });

    on<ReadOrmawaEvent>((event, emit) async {
      emit(OrmawaLoading());

      final result = await ormawaUseCase.readOrmawa(event.idOrmawa);

      result.fold(
            (failure) => emit(OrmawaError(message: failure.message)),
            (ormawa) => emit(OrmawaHasData(ormawa: ormawa)),
      );
    });

    on<UpdateOrmawaEvent>((event, emit) async {
      emit(OrmawaLoading());

      final result = await ormawaUseCase.updateOrmawa(event.ormawa);

      result.fold(
            (failure) => emit(OrmawaError(message: failure.message)),
            (message) => emit(OrmawaSuccessMessage(message: message)),
      );

      add(ReadAllOrmawaEvent());
    });

    on<DeleteOrmawaEvent>((event, emit) async {
      emit(OrmawaLoading());

      final result = await ormawaUseCase.deleteOrmawa(event.idOrmawa);

      result.fold(
            (failure) => emit(OrmawaError(message: failure.message)),
            (message) => emit(OrmawaSuccessMessage(message: message)),
      );

      add(ReadAllOrmawaEvent());
    });
  }
}
