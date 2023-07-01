import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/jenis_kegiatan_mpt_use_case.dart';

part 'jenis_kegiatan_mpt_event.dart';
part 'jenis_kegiatan_mpt_state.dart';

class JenisKegiatanMptBloc extends Bloc<JenisKegiatanMptEvent, JenisKegiatanMptState> {
  final JenisKegiatanMptUseCase jenisKegiatanMptUseCase;

  JenisKegiatanMptBloc({required this.jenisKegiatanMptUseCase}) : super(JenisKegiatanMptEmpty()) {

    on<CreateJenisKegiatanMptEvent>((event, emit) async {
      emit(JenisKegiatanMptLoading());

      final jenisKegiatanMpt = await jenisKegiatanMptUseCase.createJenisKegiatanMpt(event.jenisKegiatanMpt);

      jenisKegiatanMpt.fold(
            (failure) => emit(JenisKegiatanMptError(message: failure.message)),
            (_) => emit(const JenisKegiatanMptSuccessMessage()),
      );
    });

    on<ReadAllJenisKegiatanMptEvent>((event, emit) async {
      emit(JenisKegiatanMptLoading());

      final jenisKegiatanMpt = await jenisKegiatanMptUseCase.readJenisKegiatanMpt();

      jenisKegiatanMpt.fold(
            (failure) => emit(JenisKegiatanMptError(message: failure.message)),
            (jenisKegiatanMptList) => emit(JenisKegiatanMptHasData(jenisKegiatanMptList: jenisKegiatanMptList)),
      );
    });

    on<UpdateJenisKegiatanMptEvent>((event, emit) async {
      emit(JenisKegiatanMptLoading());

      final jenisKegiatanMpt = await jenisKegiatanMptUseCase.updateJenisKegiatanMpt(event.jenisKegiatanMpt);

      jenisKegiatanMpt.fold(
            (failure) => emit(JenisKegiatanMptError(message: failure.message)),
            (_) => emit(const JenisKegiatanMptSuccessMessage()),
      );
    });

    on<DeleteJenisKegiatanMptEvent>((event, emit) async {
      emit(JenisKegiatanMptLoading());

      final jenisKegiatanMpt = await jenisKegiatanMptUseCase.deleteJenisKegiatanMpt(event.idJenisKegiatan);

      jenisKegiatanMpt.fold(
            (failure) => emit(JenisKegiatanMptError(message: failure.message)),
            (_) => emit(const JenisKegiatanMptSuccessMessage()),
      );
    });
  }
}