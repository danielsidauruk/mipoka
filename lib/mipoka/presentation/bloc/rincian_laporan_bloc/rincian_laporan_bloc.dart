import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/rincian_laporan_use_case.dart';

part 'rincian_laporan_event.dart';
part 'rincian_laporan_state.dart';

class RincianLaporanBloc extends Bloc<RincianLaporanEvent, RincianLaporanState> {
  final RincianLaporanUseCase rincianLaporanUseCase;

  RincianLaporanBloc({required this.rincianLaporanUseCase})
      : super(RincianLaporanEmpty()) {
    on<ReadRincianLaporanEvent>((event, emit) async {
      emit(RincianLaporanLoading());

      final result = await rincianLaporanUseCase.readRincianLaporan();

      result.fold(
            (failure) => emit(RincianLaporanError(message: failure.message)),
            (rincianLaporanList) => emit(
            RincianLaporanHasData(rincianLaporanList: rincianLaporanList)),
      );
    });

    on<CreateRincianLaporanEvent>((event, emit) async {
      emit(RincianLaporanLoading());

      final result =
      await rincianLaporanUseCase.createRincianLaporan(event.rincianLaporan);

      result.fold(
            (failure) => emit(RincianLaporanError(message: failure.message)),
            (message) => emit(RincianLaporanSuccessMessage(message: message)),
      );

      add(ReadRincianLaporanEvent());
    });

    on<UpdateRincianLaporanEvent>((event, emit) async {
      emit(RincianLaporanLoading());

      final result =
      await rincianLaporanUseCase.updateRincianLaporan(event.rincianLaporan);

      result.fold(
            (failure) => emit(RincianLaporanError(message: failure.message)),
            (message) => emit(RincianLaporanSuccessMessage(message: message)),
      );

      add(ReadRincianLaporanEvent());
    });

    on<DeleteRincianLaporanEvent>((event, emit) async {
      emit(RincianLaporanLoading());

      final result =
      await rincianLaporanUseCase.deleteRincianLaporan(event.idRincianL);

      result.fold(
            (failure) => emit(RincianLaporanError(message: failure.message)),
            (message) => emit(RincianLaporanSuccessMessage(message: message)),
      );

      add(ReadRincianLaporanEvent());
    });
  }
}
