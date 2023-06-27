import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/laporan_use_case.dart';

part 'laporan_event.dart';
part 'laporan_state.dart';

class LaporanBloc extends Bloc<LaporanEvent, LaporanState> {
  final LaporanUseCase laporanUseCase;

  LaporanBloc({required this.laporanUseCase}) : super(LaporanEmpty()) {
    on<CreateLaporanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.createLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (message) => emit(LaporanSuccessMessage(message: message)),
      );

      add(ReadLaporanEvent());
    });

    on<ReadLaporanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.readAllLaporan();

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (laporanList) => emit(LaporanHasData(laporanList: laporanList)),
      );
    });

    on<UpdateLaporanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (message) => emit(LaporanSuccessMessage(message: message)),
      );

      add(ReadLaporanEvent());
    });

    on<DeleteLaporanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.deleteLaporan(event.idLaporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (message) => emit(LaporanSuccessMessage(message: message)),
      );

      add(ReadLaporanEvent());
    });
  }
}
