import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/kegiatan_per_periode_mpt_use_case.dart';

part 'kegiatan_per_periode_mpt_event.dart';
part 'kegiatan_per_periode_mpt_state.dart';

class KegiatanPerPeriodeMptBloc extends Bloc<KegiatanPerPeriodeMptEvent, KegiatanPerPeriodeMptState> {
  final KegiatanPerPeriodeMptUseCase kegiatanPerPeriodeMptUseCase;

  KegiatanPerPeriodeMptBloc({required this.kegiatanPerPeriodeMptUseCase}) : super(KegiatanPerPeriodeMptEmpty()) {

    on<CreateKegiatanPerPeriodeMptEvent>((event, emit) async {
      emit(KegiatanPerPeriodeMptLoading());

      final result = await kegiatanPerPeriodeMptUseCase.createKegiatanPerPeriodeMpt(event.kegiatanPerPeriodeMpt);

      result.fold(
            (failure) => emit(KegiatanPerPeriodeMptError(message: failure.message)),
            (_) => emit(KegiatanPerPeriodeMptSuccess()),
      );
    });

    on<ReadAllKegiatanPerPeriodeMptEvent>((event, emit) async {
      emit(KegiatanPerPeriodeMptLoading());

      final result = await kegiatanPerPeriodeMptUseCase.readAllKegiatanPerPeriodeMpt(event.filter);

      result.fold(
            (failure) => emit(KegiatanPerPeriodeMptError(message: failure.message)),
            (kegiatanList) => emit(AllKegiatanPerPeriodeMptHasData(kegiatanPerPeriodeMptList: kegiatanList)),
      );
    });

    on<ReadKegiatanPerPeriodeMptEvent>((event, emit) async {
      emit(KegiatanPerPeriodeMptLoading());

      final result = await kegiatanPerPeriodeMptUseCase.readKegiatanPerPeriodeMpt(event.idKegiatanPerPeriodeMpt);

      result.fold(
            (failure) => emit(KegiatanPerPeriodeMptError(message: failure.message)),
            (kegiatan) => emit(KegiatanPerPeriodeMptHasData(kegiatanPerPeriodeMpt: kegiatan)),
      );
    });

    on<UpdateKegiatanPerPeriodeMptEvent>((event, emit) async {
      emit(KegiatanPerPeriodeMptLoading());

      final result = await kegiatanPerPeriodeMptUseCase.updateKegiatanPerPeriodeMpt(event.kegiatanPerPeriodeMpt);

      result.fold(
            (failure) => emit(KegiatanPerPeriodeMptError(message: failure.message)),
            (_) => emit(KegiatanPerPeriodeMptSuccess()),
      );
    });

    on<DeleteKegiatanPerPeriodeMptEvent>((event, emit) async {
      emit(KegiatanPerPeriodeMptLoading());

      final result = await kegiatanPerPeriodeMptUseCase.deleteKegiatanPerPeriodeMpt(event.idKegiatanPerPeriodeMpt);

      result.fold(
            (failure) => emit(KegiatanPerPeriodeMptError(message: failure.message)),
            (_) => emit(KegiatanPerPeriodeMptSuccess()),
      );
    });
  }
}
