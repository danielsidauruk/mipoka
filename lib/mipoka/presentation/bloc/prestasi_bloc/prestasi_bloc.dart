import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/use_cases/prestasi_use_case.dart';

part 'prestasi_event.dart';
part 'prestasi_state.dart';

class PrestasiBloc extends Bloc<PrestasiEvent, PrestasiState> {
  final PrestasiUseCase prestasiUseCase;

  PrestasiBloc({required this.prestasiUseCase}) : super(PrestasiEmpty()) {
    on<ReadPrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.readAllPrestasi();

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (prestasiList) => emit(PrestasiHasData(prestasiList: prestasiList)),
      );
    });

    on<CreatePrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.createPrestasi(event.prestasi);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (message) => emit(PrestasiSuccessMessage(message: message)),
      );

      add(ReadPrestasiEvent());
    });

    on<UpdatePrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.updatePrestasi(event.prestasi);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (message) => emit(PrestasiSuccessMessage(message: message)),
      );

      add(ReadPrestasiEvent());
    });

    on<DeletePrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.deletePrestasi(event.idPrestasi);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (message) => emit(PrestasiSuccessMessage(message: message)),
      );

      add(ReadPrestasiEvent());
    });
  }
}
