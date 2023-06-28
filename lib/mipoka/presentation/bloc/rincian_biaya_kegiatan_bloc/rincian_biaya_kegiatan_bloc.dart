import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/use_cases/rincian_biaya_kegiatan_use_case.dart';

part 'rincian_biaya_kegiatan_event.dart';
part 'rincian_biaya_kegiatan_state.dart';

class RincianBiayaKegiatanBloc
    extends Bloc<RincianBiayaKegiatanEvent, RincianBiayaKegiatanState> {
  final RincianBiayaKegiatanUseCase rincianBiayaKegiatanUseCase;

  RincianBiayaKegiatanBloc({required this.rincianBiayaKegiatanUseCase})
      : super(RincianBiayaKegiatanEmpty()) {


    on<CreateRincianBiayaKegiatanEvent>((event, emit) async {
      emit(RincianBiayaKegiatanLoading());

      final result =
      await rincianBiayaKegiatanUseCase.createRincianBiayaKegiatan(
        idLaporan: event.idLaporan,
        rincianBiayaKegiatan: event.rincianBiayaKegiatan,
      );

      result.fold(
            (failure) => emit(RincianBiayaKegiatanError(message: failure.message)),
            (_) => emit(RincianBiayaKegiatanSuccess()),
      );
    });

    on<UpdateRincianBiayaKegiatanEvent>((event, emit) async {
      emit(RincianBiayaKegiatanLoading());

      final result =
      await rincianBiayaKegiatanUseCase.updateRincianBiayaKegiatan(event.rincianBiayaKegiatan);

      result.fold(
            (failure) => emit(RincianBiayaKegiatanError(message: failure.message)),
            (message) => emit(RincianBiayaKegiatanSuccess()),
      );
    });

    on<DeleteRincianBiayaKegiatanEvent>((event, emit) async {
      emit(RincianBiayaKegiatanLoading());

      final result = await rincianBiayaKegiatanUseCase.deleteRincianBiayaKegiatan(event.idRincianBiayaKegiatan);

      result.fold(
            (failure) => emit(RincianBiayaKegiatanError(message: failure.message)),
            (message) => emit(RincianBiayaKegiatanSuccess()),
      );
    });
  }
}
