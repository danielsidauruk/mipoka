import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/nama_kegiatan_mpt.dart';

part 'nama_kegiatan_drop_down_event.dart';
part 'nama_kegiatan_drop_down_state.dart';

class NamaKegiatanDropDownBloc extends Bloc<NamaKegiatanDropDownEvent, NamaKegiatanDropDownState> {
  final NamaKegiatanMptUseCase namaKegiatanMptUseCase;

  NamaKegiatanDropDownBloc({required this.namaKegiatanMptUseCase}) : super(NamaKegiatanDropDownEmpty()) {
    on<ReadNamaKegiatanDropDownEvent>((event, emit) async {
      emit(NamaKegiatanDropDownLoading());

      final result = await namaKegiatanMptUseCase.readAllNamaKegiatanMpt("semua");

      result.fold(
            (failure) => emit(NamaKegiatanDropDownError(message: failure.message)),
            (namaKegiatanList) => emit(NamaKegiatanDropDownHasData(namaKegiatanList: namaKegiatanList)),
      );
    });
  }
}
