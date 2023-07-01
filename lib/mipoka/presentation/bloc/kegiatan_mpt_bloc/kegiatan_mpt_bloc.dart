import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/kegiatan_mpt_use_case.dart';

part 'kegiatan_mpt_event.dart';
part 'kegiatan_mpt_state.dart';

class KegiatanMptBloc extends Bloc<KegiatanMptEvent, KegiatanMptState> {
  final KegiatanMptUseCase kegiatanMptUseCase;

  KegiatanMptBloc({required this.kegiatanMptUseCase}) : super(KegiatanMptEmpty()) {

    on<CreateKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.createKegiatan(event.kegiatanMpt);

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (_) => emit(const KegiatanMptSuccessMessage()),
      );
    });

    on<ReadAllKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.readAllKegiatanMpt(event.filter);

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (kegiatanList) => emit(AllKegiatanMptHasData(kegiatanList: kegiatanList)),
      );
    });

    on<ReadKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.readKegiatanMpt(event.idKegiatanMpt);

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (kegiatan) => emit(KegiatanMptHasData(kegiatan: kegiatan)),
      );
    });

    on<UpdateKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.updateKegiatanMpt(event.kegiatanMpt);

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (_) => emit(const KegiatanMptSuccessMessage()),
      );
    });

    on<DeleteKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.deleteKegiatanMpt(event.idKegiatanMpt);

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (_) => emit(const KegiatanMptSuccessMessage()),
      );
    });
  }
}
