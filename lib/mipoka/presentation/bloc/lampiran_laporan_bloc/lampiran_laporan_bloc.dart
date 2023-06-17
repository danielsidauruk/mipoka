import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran_laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/lampiran_laporan_use_case.dart';

part 'lampiran_laporan_event.dart';
part 'lampiran_laporan_state.dart';

class LampiranLaporanBloc extends Bloc<LampiranLaporanEvent, LampiranLaporanState> {
  final LampiranLaporanUseCase lampiranLaporanUseCase;

  LampiranLaporanBloc({required this.lampiranLaporanUseCase}) : super(LampiranLaporanEmpty()) {
    on<CreateLampiranLaporanEvent>((event, emit) async {
      emit(LampiranLaporanLoading());

      final result = await lampiranLaporanUseCase.createLampiranLaporan(event.lampiranLaporan);

      result.fold(
            (failure) => emit(LampiranLaporanError(message: failure.message)),
            (message) => emit(LampiranLaporanSuccessMessage(message: message)),
      );

      add(ReadLampiranLaporanEvent());
    });

    on<ReadLampiranLaporanEvent>((event, emit) async {
      emit(LampiranLaporanLoading());

      final result = await lampiranLaporanUseCase.readLampiranLaporan();

      result.fold(
            (failure) => emit(LampiranLaporanError(message: failure.message)),
            (lampiranLaporanList) => emit(LampiranLaporanHasData(lampiranLaporanList: lampiranLaporanList)),
      );
    });

    on<UpdateLampiranLaporanEvent>((event, emit) async {
      emit(LampiranLaporanLoading());

      final result = await lampiranLaporanUseCase.updateLampiranLaporan(event.lampiranLaporan);

      result.fold(
            (failure) => emit(LampiranLaporanError(message: failure.message)),
            (message) => emit(LampiranLaporanSuccessMessage(message: message)),
      );

      add(ReadLampiranLaporanEvent());
    });

    on<DeleteLampiranLaporanEvent>((event, emit) async {
      emit(LampiranLaporanLoading());

      final result = await lampiranLaporanUseCase.deleteLampiranLaporan(event.idLampiranLaporan);

      result.fold(
            (failure) => emit(LampiranLaporanError(message: failure.message)),
            (message) => emit(LampiranLaporanSuccessMessage(message: message)),
      );

      add(ReadLampiranLaporanEvent());
    });
  }
}
