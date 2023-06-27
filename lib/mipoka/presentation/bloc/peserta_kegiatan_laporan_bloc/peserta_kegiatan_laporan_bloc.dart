import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/use_cases/peserta_kegiatan_laporan_use_case.dart';

part 'peserta_kegiatan_laporan_event.dart';
part 'peserta_kegiatan_laporan_state.dart';

class PesertaKegiatanLaporanBloc extends Bloc<PesertaKegiatanLaporanEvent, PesertaKegiatanLaporanState> {
  final PesertaKegiatanLaporanUseCase pesertaKegiatanLaporanUseCase;

  PesertaKegiatanLaporanBloc({required this.pesertaKegiatanLaporanUseCase}) : super(PesertaKegiatanLaporanEmpty()) {

    on<ReadAllPesertaKegiatanLaporanEvent>((event, emit) async {
      emit(PesertaKegiatanLaporanLoading());

      final result = await pesertaKegiatanLaporanUseCase.readAllPesertaKegiatanLaporan();

      result.fold(
            (failure) => emit(PesertaKegiatanLaporanError(message: failure.message)),
            (pesertaKegiatanLaporanList) => emit(AllPesertaKegiatanLaporanHasData(pesertaKegiatanLaporanList: pesertaKegiatanLaporanList)),
      );
    });

    on<ReadPesertaKegiatanLaporanEvent>((event, emit) async {
      emit(PesertaKegiatanLaporanLoading());

      final result = await pesertaKegiatanLaporanUseCase.readPesertaKegiatanLaporan(event.idPesertaKegiatanLaporan);

      result.fold(
            (failure) => emit(PesertaKegiatanLaporanError(message: failure.message)),
            (pesertaKegiatanLaporan) => emit(PesertaKegiatanLaporanHasData(pesertaKegiatanLaporan: pesertaKegiatanLaporan)),
      );
    });

    on<CreatePesertaKegiatanLaporanEvent>((event, emit) async {
      emit(PesertaKegiatanLaporanLoading());

      final result = await pesertaKegiatanLaporanUseCase.createPesertaKegiatanLaporan(event.pesertaKegiatanLaporan);

      result.fold(
            (failure) => emit(PesertaKegiatanLaporanError(message: failure.message)),
            (message) => emit(PesertaKegiatanLaporanSuccessMessage(message: message)),
      );

      add(ReadAllPesertaKegiatanLaporanEvent());
    });

    on<UpdatePesertaKegiatanLaporanEvent>((event, emit) async {
      emit(PesertaKegiatanLaporanLoading());

      final result = await pesertaKegiatanLaporanUseCase.updatePesertaKegiatanLaporan(event.pesertaKegiatanLaporan);

      result.fold(
            (failure) => emit(PesertaKegiatanLaporanError(message: failure.message)),
            (message) => emit(PesertaKegiatanLaporanSuccessMessage(message: message)),
      );

      add(ReadAllPesertaKegiatanLaporanEvent());
    });

    on<DeletePesertaKegiatanLaporanEvent>((event, emit) async {
      emit(PesertaKegiatanLaporanLoading());

      final result = await pesertaKegiatanLaporanUseCase.deletePesertaKegiatanLaporan(event.idPesertaKegiatanLaporan);

      result.fold(
            (failure) => emit(PesertaKegiatanLaporanError(message: failure.message)),
            (message) => emit(PesertaKegiatanLaporanSuccessMessage(message: message)),
      );

      add(ReadAllPesertaKegiatanLaporanEvent());
    });
  }
}
