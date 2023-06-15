import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mipoka/core/use_case.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/use_cases/berita_use_case.dart';

part 'berita_event.dart';
part 'berita_state.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  final BeritaUseCase beritaUseCase;

  BeritaBloc({required this.beritaUseCase}) : super(ReadBeritaEmpty()) {
    on<LoadBeritaEvent>((event, emit) async {
      emit (ReadBeritaLoading());

      final berita = await beritaUseCase.readBerita(NoParams());

      berita.fold(
            (failure) => emit(ReadBeritaError(message: failure.message)),
            (berita) => emit(ReadBeritaHasData(berita: berita)),
      );
    });
  }
}
