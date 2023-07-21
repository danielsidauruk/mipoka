import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/use_cases/prestasi_use_case.dart';

part 'prestasi_event.dart';
part 'prestasi_state.dart';

class PrestasiBloc extends Bloc<PrestasiEvent, PrestasiState> {
  final PrestasiUseCase prestasiUseCase;

  PrestasiBloc({required this.prestasiUseCase}) : super(PrestasiEmpty()) {

    on<ReadAllPrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.readAllPrestasi(event.filter);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (prestasiList) => emit(AllPrestasiHasData(prestasiList: prestasiList)),
      );
    });

    on<ReadPrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.readPrestasi(event.idPrestasi);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (prestasi) => emit(PrestasiHasData(prestasi: prestasi)),
      );
    });

    on<CreatePrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.createPrestasi(event.prestasi);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (_) => emit(const PrestasiSuccess()),
      );
    });

    on<UpdatePrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.updatePrestasi(event.prestasi);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (_) => emit(const PrestasiSuccess()),
      );
    });

    on<DeletePrestasiEvent>((event, emit) async {
      emit(PrestasiLoading());

      final result = await prestasiUseCase.deletePrestasi(event.idPrestasi);

      result.fold(
            (failure) => emit(PrestasiError(message: failure.message)),
            (_) => emit(const PrestasiSuccess()),
      );
    });
  }
}
