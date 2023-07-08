import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/riwayat_kegiatan_mpt_use_case.dart';

part 'riwayat_kegiatan_mpt_event.dart';
part 'riwayat_kegiatan_mpt_state.dart';

class RiwayatKegiatanMptBloc extends Bloc<RiwayatKegiatanMptEvent, RiwayatKegiatanMptState> {
  final RiwayatKegiatanMptUseCase riwayatKegiatanMptUseCase;

  RiwayatKegiatanMptBloc({required this.riwayatKegiatanMptUseCase}) : super(RiwayatKegiatanMptEmpty()) {

    on<ReadAllRiwayatKegiatanMptEvent>((event, emit) async {
      emit(RiwayatKegiatanMptLoading());

      final result = await riwayatKegiatanMptUseCase.readAllRiwayatKegiatanMpt(event.filter);

      result.fold(
            (failure) => emit(RiwayatKegiatanMptError(message: failure.message)),
            (riwayatKegiatanMptList) =>
            emit(AllRiwayatKegiatanMptHasData(riwayatKegiatanMptList: riwayatKegiatanMptList)),
      );
    });

    on<ReadRiwayatKegiatanMptEvent>((event, emit) async {
      emit(RiwayatKegiatanMptLoading());

      final result = await riwayatKegiatanMptUseCase.readRiwayatKegiatanMpt(event.idRiwayatKegiatanMptEvent);

      result.fold(
            (failure) => emit(RiwayatKegiatanMptError(message: failure.message)),
            (riwayatKegiatanMpt) => emit(RiwayatKegiatanMptHasData(riwayatKegiatanMpt: riwayatKegiatanMpt)),
      );
    });

    on<CreateRiwayatKegiatanMptEvent>((event, emit) async {
      emit(RiwayatKegiatanMptLoading());

      final result =
      await riwayatKegiatanMptUseCase.createRiwayatKegiatanMpt(event.riwayatKegiatanMpt);

      result.fold(
            (failure) => emit(RiwayatKegiatanMptError(message: failure.message)),
            (_) => emit(const RiwayatKegiatanMptSuccessMessage()),
      );
    });

    on<UpdateRiwayatKegiatanMptEvent>((event, emit) async {
      emit(RiwayatKegiatanMptLoading());

      final result =
      await riwayatKegiatanMptUseCase.updateRiwayatKegiatanMpt(event.riwayatKegiatanMpt);

      result.fold(
            (failure) => emit(RiwayatKegiatanMptError(message: failure.message)),
            (_) => emit(const RiwayatKegiatanMptSuccessMessage()),
      );
    });

    on<DeleteRiwayatMptEvent>((event, emit) async {
      emit(RiwayatKegiatanMptLoading());

      final result =
      await riwayatKegiatanMptUseCase.deleteRiwayatKegiatanMpt(event.idRiwayatKegiatanMpt);

      result.fold(
            (failure) => emit(RiwayatKegiatanMptError(message: failure.message)),
            (_) => emit(const RiwayatKegiatanMptSuccessMessage()),
      );
    });
  }
}
