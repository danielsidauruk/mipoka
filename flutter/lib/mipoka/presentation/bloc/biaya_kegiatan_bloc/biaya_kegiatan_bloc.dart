import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/use_cases/biaya_kegiatan_use_case.dart';

part 'biaya_kegiatan_event.dart';
part 'biaya_kegiatan_state.dart';

class BiayaKegiatanBloc extends Bloc<BiayaKegiatanEvent, BiayaKegiatanState> {
  final BiayaKegiatanUseCase biayaKegiatanUseCase;

  BiayaKegiatanBloc({required this.biayaKegiatanUseCase}) : super(BiayaKegiatanEmpty()) {

    on<CreateBiayaKegiatanEvent>((event, emit) async {
      emit(BiayaKegiatanEmpty());

      final result = await biayaKegiatanUseCase.createBiayaKegiatan(
        idUsulanKegiatan: event.idUsulanKegiatan,
        biayaKegiatan: event.biayaKegiatan,
      );

      result.fold(
            (failure) => emit(BiayaKegiatanError(message: failure.message)),
            (_) => emit(const BiayaKegiatanSuccessMessage()),
      );
    });

    on<UpdateBiayaKegiatanEvent>((event, emit) async {
      emit(BiayaKegiatanLoading());

      final result = await biayaKegiatanUseCase.updateBiayaKegiatan(event.biayaKegiatan);

      result.fold(
            (failure) => emit(BiayaKegiatanError(message: failure.message)),
            (_) => emit(const BiayaKegiatanSuccessMessage()),
      );
    });

    on<DeleteBiayaKegiatanEvent>((event, emit) async {
      emit(BiayaKegiatanLoading());

      final result = await biayaKegiatanUseCase.deleteBiayaKegiatan(event.idBiayaKegiatan);

      result.fold(
            (failure) => emit(BiayaKegiatanError(message: failure.message)),
            (_) => emit(const BiayaKegiatanSuccessMessage()),
      );
    });
  }
}

