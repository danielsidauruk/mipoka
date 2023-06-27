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
            (message) => emit(KegiatanMptSuccessMessage(message: message)),
      );

      add(ReadKegiatanMptEvent());
    });

    on<ReadKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.readAllKegiatan();

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (kegiatanList) => emit(KegiatanMptHasData(kegiatanList: kegiatanList)),
      );
    });

    on<UpdateKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.updateKegiatan(event.kegiatanMpt);

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (message) => emit(KegiatanMptSuccessMessage(message: message)),
      );

      add(ReadKegiatanMptEvent());
    });

    on<DeleteKegiatanMptEvent>((event, emit) async {
      emit(KegiatanMptLoading());

      final result = await kegiatanMptUseCase.deleteKegiatan(event.idKegiatanMpt);

      result.fold(
            (failure) => emit(KegiatanMptError(message: failure.message)),
            (message) => emit(KegiatanMptSuccessMessage(message: message)),
      );

      add(ReadKegiatanMptEvent());
    });
  }
}
