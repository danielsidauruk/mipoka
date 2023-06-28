import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/use_cases/tertib_acara_use_case.dart';

part 'tertib_acara_event.dart';
part 'tertib_acara_state.dart';

class TertibAcaraBloc extends Bloc<TertibAcaraEvent, TertibAcaraState> {
  final TertibAcaraUseCase tertibAcaraUseCase;

  TertibAcaraBloc({required this.tertibAcaraUseCase}) : super(TertibAcaraEmpty()) {

    on<CreateTertibAcaraEvent>((event, emit) async {
      emit(TertibAcaraLoading());

      final result = await tertibAcaraUseCase.createTertibAcara(
        idUsulanKegiatan: event.idUsulanKegiatan,
        tertibAcara: event.tertibAcara,
      );

      result.fold(
            (failure) => emit(TertibAcaraError(message: failure.message)),
            (_) => emit(const TertibAcaraSuccessMessage()),
      );
    });

    on<UpdateTertibAcaraEvent>((event, emit) async {
      emit(TertibAcaraLoading());

      final result = await tertibAcaraUseCase.updateTertibAcara(event.tertibAcara);

      result.fold(
            (failure) => emit(TertibAcaraError(message: failure.message)),
            (_) => emit(const TertibAcaraSuccessMessage()),
      );
    });

    on<DeleteTertibAcaraEvent>((event, emit) async {
      emit(TertibAcaraLoading());

      final result = await tertibAcaraUseCase.deleteTertibAcara(event.idTertibAcara);

      result.fold(
            (failure) => emit(TertibAcaraError(message: failure.message)),
            (_) => emit(const TertibAcaraSuccessMessage()),
      );
    });
  }
}
