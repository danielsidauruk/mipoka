import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/peserta_kegiatan_laporan_use_case.dart';

part 'peserta_event.dart';
part 'peserta_state.dart';

class PesertaBloc extends Bloc<PesertaEvent, PesertaState> {
  final PesertaKegiatanLaporanUseCase pesertaUseCase;

  PesertaBloc({required this.pesertaUseCase}) : super(PesertaEmpty()) {
    on<ReadPesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.readAllPesertaKegiatanLaporan();

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (pesertaList) => emit(PesertaHasData(pesertaList: pesertaList)),
      );
    });

    on<CreatePesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.createPesertaKegiatanLaporan(event.peserta);

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (message) => emit(PesertaSuccessMessage(message: message)),
      );

      add(ReadPesertaEvent());
    });

    on<UpdatePesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.updatePesertaKegiatanLaporan(event.peserta);

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (message) => emit(PesertaSuccessMessage(message: message)),
      );

      add(ReadPesertaEvent());
    });

    on<DeletePesertaEvent>((event, emit) async {
      emit(PesertaLoading());

      final result = await pesertaUseCase.deletePesertaKegiatanLaporan(event.idPeserta);

      result.fold(
            (failure) => emit(PesertaError(message: failure.message)),
            (message) => emit(PesertaSuccessMessage(message: message)),
      );

      add(ReadPesertaEvent());
    });
  }
}
