import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/jenis_kegiatan_mpt_use_case.dart';

part 'jenis_kegiatan_drop_down_event.dart';
part 'jenis_kegiatan_drop_down_state.dart';

class JenisKegiatanDropDownBloc extends Bloc<JenisKegiatanDropDownEvent, JenisKegiatanDropDownState> {
  final JenisKegiatanMptUseCase jenisKegiatanMptUseCase;

  JenisKegiatanDropDownBloc({required this.jenisKegiatanMptUseCase}) : super(JenisKegiatanDropDownEmpty()) {
    on<ReadJenisKegiatanDropDownEvent>((event, emit) async {
      emit(JenisKegiatanDropDownLoading());

      final result = await jenisKegiatanMptUseCase.readAllJenisKegiatanMpt("semua");

      result.fold(
            (failure) => emit(JenisKegiatanDropDownError(message: failure.message)),
            (jenisKegiatanList) => emit(JenisKegiatanDropDownHasData(jenisKegiatanMptList: jenisKegiatanList)),
      );
    });
  }
}
