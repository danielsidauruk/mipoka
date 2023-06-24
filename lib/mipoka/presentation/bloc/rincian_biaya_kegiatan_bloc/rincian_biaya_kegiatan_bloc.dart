import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/use_cases/rincian_biaya_kegiatan_use_case.dart';

part 'rincian_biaya_kegiatan_event.dart';
part 'rincian_biaya_kegiatan_state.dart';

class RincianBiayaKegiatanBloc
    extends Bloc<RincianBiayaKegiatanEvent, RincianBiayaKegiatanState> {
  final RincianBiayaKegiatanUseCase rincianBiayaKegiatanUseCase;

  RincianBiayaKegiatanBloc({required this.rincianBiayaKegiatanUseCase})
      : super(RincianBiayaKegiatanEmpty()) {
    on<ReadRincianBiayaKegiatanEvent>((event, emit) async {
      emit(RincianBiayaKegiatanLoading());

      final result = await rincianBiayaKegiatanUseCase.readRincianBiayaKegiatan();

      result.fold(
            (failure) => emit(RincianBiayaKegiatanError(message: failure.message)),
            (rincianBiayaKegiatanList) => emit(RincianBiayaKegiatanHasData(
            rincianBiayaKegiatanList: rincianBiayaKegiatanList)),
      );
    });

    on<CreateRincianBiayaKegiatanEvent>((event, emit) async {
      emit(RincianBiayaKegiatanLoading());

      final result =
      await rincianBiayaKegiatanUseCase.createRincianBiayaKegiatan(event.rincianBiayaKegiatan);

      result.fold(
            (failure) => emit(RincianBiayaKegiatanError(message: failure.message)),
            (message) => emit(RincianBiayaKegiatanSuccessMessage(message: message)),
      );

      add(ReadRincianBiayaKegiatanEvent());
    });

    on<UpdateRincianBiayaKegiatanEvent>((event, emit) async {
      emit(RincianBiayaKegiatanLoading());

      final result =
      await rincianBiayaKegiatanUseCase.updateRincianBiayaKegiatan(event.rincianBiayaKegiatan);

      result.fold(
            (failure) => emit(RincianBiayaKegiatanError(message: failure.message)),
            (message) => emit(RincianBiayaKegiatanSuccessMessage(message: message)),
      );

      add(ReadRincianBiayaKegiatanEvent());
    });

    on<DeleteRincianBiayaKegiatanEvent>((event, emit) async {
      emit(RincianBiayaKegiatanLoading());

      final result = await rincianBiayaKegiatanUseCase.deleteRincianBiayaKegiatan(event.idRincianBiayaKegiatan);

      result.fold(
            (failure) => emit(RincianBiayaKegiatanError(message: failure.message)),
            (message) => emit(RincianBiayaKegiatanSuccessMessage(message: message)),
      );

      add(ReadRincianBiayaKegiatanEvent());
    });
  }
}
