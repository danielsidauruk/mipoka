import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/revisi_laporan_use_case.dart';

part 'revisi_laporan_event.dart';
part 'revisi_laporan_state.dart';

class RevisiLaporanBloc extends Bloc<RevisiLaporanEvent, RevisiLaporanState> {
  final RevisiLaporanUseCase revisiLaporanUseCase;

  RevisiLaporanBloc({required this.revisiLaporanUseCase}) : super(RevisiLaporanEmpty()) {
    on<ReadRevisiLaporanEvent>((event, emit) async {
      emit(RevisiLaporanLoading());

      final result = await revisiLaporanUseCase.readRevisiLaporan(event.idRevisiLaporan);

      result.fold(
            (failure) => emit(RevisiLaporanError(message: failure.message)),
            (revisiLaporan) => emit(RevisiLaporanHasData(revisiLaporan: revisiLaporan)),
      );
    });

    on<CreateRevisiLaporanEvent>((event, emit) async {
      emit(RevisiLaporanLoading());

      final result = await revisiLaporanUseCase.createRevisiLaporan(event.revisiLaporan);

      result.fold(
            (failure) => emit(RevisiLaporanError(message: failure.message)),
            (_) => emit(RevisiLaporanSuccess()),
      );
    });

    on<UpdateRevisiLaporanEvent>((event, emit) async {
      emit(RevisiLaporanLoading());

      final result = await revisiLaporanUseCase.updateRevisiLaporan(event.revisiLaporan);

      result.fold(
            (failure) => emit(RevisiLaporanError(message: failure.message)),
            (_) => emit(RevisiLaporanSuccess()),
      );
    });

    on<DeleteRevisiLaporanEvent>((event, emit) async {
      emit(RevisiLaporanLoading());

      final result = await revisiLaporanUseCase.deleteRevisiLaporan(event.idRevisiLaporan);

      result.fold(
            (failure) => emit(RevisiLaporanError(message: failure.message)),
            (_) => emit(RevisiLaporanSuccess()),
      );
    });
  }
}
