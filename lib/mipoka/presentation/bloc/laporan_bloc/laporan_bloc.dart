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
            (_) => emit(CreateLaporanSuccess()),
      );
    });

    on<ReadAllLaporanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.readAllLaporan(event.filter);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (laporanList) => emit(AllLaporanHasData(laporanList: laporanList)),
      );
    });

    on<ReadLaporanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.readLaporan(event.idLaporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (laporan) => emit(LaporanHasData(laporan: laporan)),
      );
    });

    on<UpdateLaporanFirstPageEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(const UpdateLaporanFirstPageSuccess()),
      );
    });

    on<UpdateLaporanSecondPageEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateLaporanSecondPageSuccess()),
      );
    });

    on<UpdateRincianBiayaEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateRincianBiayaSuccess()),
      );
    });

    on<DeleteDataPesertaEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(DeleteDataPesertaSuccess()),
      );
    });

  /*  on<UpdateDataPesertaEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateDataPesertaSuccess()),
      );
    });*/

    on<UpdateLaporanLastPageEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateLaporanLastPageSuccess()),
      );
    });

    on<UpdateLaporanAndSendEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateLaporanAndSendSuccess()),
      );
    });

    on<UpdateLaporanReviseFirstPageEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateLaporanReviseFirstPageSuccess()),
      );
    });

    on<UpdateLaporanReviseSecondPageEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateLaporanReviseSecondPageSuccess()),
      );
    });

    on<UpdateLaporanReviseLastPageEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(UpdateLaporanReviseLastPageSuccess()),
      );
    });

    on<DeleteLaporanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.deleteLaporan(event.idLaporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(DeleteLaporanSuccess()),
      );
    });

    on<AddDataPesertaKegiatanEvent>((event, emit) async {
      emit(LaporanLoading());

      final result = await laporanUseCase.updateLaporan(event.laporan);

      result.fold(
            (failure) => emit(LaporanError(message: failure.message)),
            (_) => emit(AddDataPesertaKegiatanSuccess()),
      );
    });
  }
}
