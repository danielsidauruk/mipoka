import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/peserta_use_case.dart';

part 'peserta_event.dart';
part 'peserta_state.dart';

class PesertaBloc extends Bloc<PesertaEvent, PesertaState> {
  final PesertaUseCase pesertaUseCase;

  PesertaBloc({required this.pesertaUseCase}) : super(PesertaEmpty()) {
    on<ReadPesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.readPeserta();

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (pesertaList) => emit(PesertaHasData(pesertaList: pesertaList)),
      );
    });

    on<CreatePesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.createPeserta(event.peserta);

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (message) => emit(PesertaSuccessMessage(message: message)),
      );

      add(ReadPesertaEvent());
    });

    on<UpdatePesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.updatePeserta(event.peserta);

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (message) => emit(PesertaSuccessMessage(message: message)),
      );

      add(ReadPesertaEvent());
    });

    on<DeletePesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.deletePeserta(event.idPeserta);

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (message) => emit(PesertaSuccessMessage(message: message)),
      );

      add(ReadPesertaEvent());
    });
  }
}
