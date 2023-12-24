import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/nama_kegiatan_mpt.dart';


part 'nama_kegiatan_mpt_event.dart';
part 'nama_kegiatan_mpt_state.dart';

class NamaKegiatanMptBloc extends Bloc<NamaKegiatanMptEvent, NamaKegiatanMptState> {
  final NamaKegiatanMptUseCase namaKegiatanMptUseCase;

  NamaKegiatanMptBloc({required this.namaKegiatanMptUseCase}) : super(NamaKegiatanMptEmpty()) {

    on<CreateNamaKegiatanMptEvent>((event, emit) async {
      emit(NamaKegiatanMptLoading());

      final result = await namaKegiatanMptUseCase.createNamaKegiatanMpt(event.namaKegiatanMpt);

      result.fold(
            (failure) => emit(NamaKegiatanMptError(message: failure.message)),
            (_) => emit(const NamaKegiatanMptSuccess()),
      );
    });

    on<ReadAllNamaKegiatanMptEvent>((event, emit) async {
      emit(NamaKegiatanMptLoading());

      final result = await namaKegiatanMptUseCase.readAllNamaKegiatanMpt(event.id);

      result.fold(
            (failure) => emit(NamaKegiatanMptError(message: failure.message)),
            (namaKegiatanMptList) => emit(AllNamaKegiatanMptHasData(namaKegiatanMptList: namaKegiatanMptList)),
      );
    });

    on<ReadNamaKegiatanMptEvent>((event, emit) async {
      emit(NamaKegiatanMptLoading());

      final result = await namaKegiatanMptUseCase.readNamaKegiatanMpt(event.idNamaKegiatanMpt);

      result.fold(
            (failure) => emit(NamaKegiatanMptError(message: failure.message)),
            (namaKegiatanMpt) => emit(NamaKegiatanMptHasData(namaKegiatanMpt: namaKegiatanMpt)),
      );
    });

    on<UpdateNamaKegiatanMptEvent>((event, emit) async {
      emit(NamaKegiatanMptLoading());

      final result = await namaKegiatanMptUseCase.updateNamaKegiatanMpt(event.namaKegiatanMpt);

      result.fold(
            (failure) => emit(NamaKegiatanMptError(message: failure.message)),
            (_) => emit(const NamaKegiatanMptSuccess()),
      );
    });

    on<DeleteNamaKegiatanMptEvent>((event, emit) async {
      emit(NamaKegiatanMptLoading());

      final result = await namaKegiatanMptUseCase.deleteNamaKegiatanMpt(event.idNamaKegiatanMpt);

      result.fold(
            (failure) => emit(NamaKegiatanMptError(message: failure.message)),
            (_) => emit(const NamaKegiatanMptSuccess()),
      );
    });
  }
}
