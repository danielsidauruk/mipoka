import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan.dart';
import 'package:mipoka/mipoka/domain/use_cases/kegiatan_use_case.dart';

part 'kegiatan_event.dart';
part 'kegiatan_state.dart';

class KegiatanBloc extends Bloc<KegiatanEvent, KegiatanState> {
  final KegiatanUseCase kegiatanUseCase;

  KegiatanBloc({required this.kegiatanUseCase}) : super(KegiatanEmpty()) {
    on<CreateKegiatanEvent>((event, emit) async {
      emit(KegiatanLoading());

      final result = await kegiatanUseCase.createKegiatan(event.kegiatan);

      result.fold(
            (failure) => emit(KegiatanError(message: failure.message)),
            (message) => emit(KegiatanSuccessMessage(message: message)),
      );

      add(ReadKegiatanEvent());
    });

    on<ReadKegiatanEvent>((event, emit) async {
      emit(KegiatanLoading());

      final result = await kegiatanUseCase.readKegiatan();

      result.fold(
            (failure) => emit(KegiatanError(message: failure.message)),
            (kegiatanList) => emit(KegiatanHasData(kegiatanList: kegiatanList)),
      );
    });

    on<UpdateKegiatanEvent>((event, emit) async {
      emit(KegiatanLoading());

      final result = await kegiatanUseCase.updateKegiatan(event.kegiatan);

      result.fold(
            (failure) => emit(KegiatanError(message: failure.message)),
            (message) => emit(KegiatanSuccessMessage(message: message)),
      );

      add(ReadKegiatanEvent());
    });

    on<DeleteKegiatanEvent>((event, emit) async {
      emit(KegiatanLoading());

      final result = await kegiatanUseCase.deleteKegiatan(event.idKegiatan);

      result.fold(
            (failure) => emit(KegiatanError(message: failure.message)),
            (message) => emit(KegiatanSuccessMessage(message: message)),
      );

      add(ReadKegiatanEvent());
    });
  }
}
