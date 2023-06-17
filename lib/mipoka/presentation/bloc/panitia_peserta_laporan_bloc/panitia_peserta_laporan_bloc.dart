import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/panitia_peserta_laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/panitia_peserta_laporan_use_case.dart';

part 'panitia_peserta_laporan_event.dart';
part 'panitia_peserta_laporan_state.dart';

class PanitiaPesertaLaporanBloc extends Bloc<PanitiaPesertaLaporanEvent, PanitiaPesertaLaporanState> {
  final PanitiaPesertaLaporanUseCase panitiaPesertaLaporanUseCase;

  PanitiaPesertaLaporanBloc({required this.panitiaPesertaLaporanUseCase}) : super(PanitiaPesertaLaporanEmpty()) {
    on<CreatePanitiaPesertaLaporanEvent>((event, emit) async {
      emit(PanitiaPesertaLaporanLoading());

      final result = await panitiaPesertaLaporanUseCase.createPanitiaPesertaL(event.panitiaPesertaLaporan);

      result.fold(
            (failure) => emit(PanitiaPesertaLaporanError(message: failure.message)),
            (message) => emit(PanitiaPesertaLaporanSuccessMessage(message: message)),
      );

      add(ReadPanitiaPesertaLaporanEvent());
    });

    on<ReadPanitiaPesertaLaporanEvent>((event, emit) async {
      emit(PanitiaPesertaLaporanLoading());

      final result = await panitiaPesertaLaporanUseCase.readPanitiaPesertaL();

      result.fold(
            (failure) => emit(PanitiaPesertaLaporanError(message: failure.message)),
            (panitiaPesertaLaporanList) => emit(PanitiaPesertaLaporanHasData(panitiaPesertaLaporanList: panitiaPesertaLaporanList)),
      );
    });

    on<UpdatePanitiaPesertaLaporanEvent>((event, emit) async {
      emit(PanitiaPesertaLaporanLoading());

      final result = await panitiaPesertaLaporanUseCase.updatePanitiaPesertaLaporan(event.panitiaPesertaLaporan);

      result.fold(
            (failure) => emit(PanitiaPesertaLaporanError(message: failure.message)),
            (message) => emit(PanitiaPesertaLaporanSuccessMessage(message: message)),
      );

      add(ReadPanitiaPesertaLaporanEvent());
    });

    on<DeletePanitiaPesertaLaporanEvent>((event, emit) async {
      emit(PanitiaPesertaLaporanLoading());

      final result = await panitiaPesertaLaporanUseCase.deletePanitiaPesertaLaporan(event.idPanitiaPesertaLaporan);

      result.fold(
            (failure) => emit(PanitiaPesertaLaporanError(message: failure.message)),
            (message) => emit(PanitiaPesertaLaporanSuccessMessage(message: message)),
      );

      add(ReadPanitiaPesertaLaporanEvent());
    });
  }
}
