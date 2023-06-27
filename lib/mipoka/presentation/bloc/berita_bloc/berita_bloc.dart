import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/use_cases/berita_use_case.dart';

part 'berita_event.dart';
part 'berita_state.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  final BeritaUseCase beritaUseCase;

  BeritaBloc({required this.beritaUseCase}) : super(BeritaEmpty()) {

    on<CreateBeritaEvent>((event, emit) async {
      emit(BeritaLoading());

      final berita = await beritaUseCase.createBerita(event.berita);

      berita.fold(
        (failure) => emit(BeritaError(message: failure.message)),
        (message) => emit(BeritaSuccessMessage(message: message)),
      );
    });

    on<ReadBeritaEvent>((event, emit) async {
      emit(BeritaLoading());

      final berita = await beritaUseCase.readBerita(event.idBerita);

      berita.fold(
            (failure) => emit(BeritaError(message: failure.message)),
            (berita) => emit(BeritaHasData(berita: berita)),
      );
    });

    on<ReadAllBeritaEvent>((event, emit) async {
      emit(BeritaLoading());

      final allBerita = await beritaUseCase.readAllBerita();

      allBerita.fold(
        (failure) => emit(BeritaError(message: failure.message)),
        (allBerita) => emit(AllBeritaHasData(allBerita: allBerita)),
      );
    });

    on<UpdateBeritaEvent>((event, emit) async {
      emit(BeritaLoading());

      final berita = await beritaUseCase.updateBerita(event.berita);

      berita.fold(
        (failure) => emit(BeritaError(message: failure.message)),
        (message) => emit(BeritaSuccessMessage(message: message)),
      );
    });

    on<DeleteBeritaEvent>((event, emit) async {
      emit(BeritaLoading());

      final berita = await beritaUseCase.deleteBerita(event.beritaId);

      berita.fold(
        (failure) => emit(BeritaError(message: failure.message)),
        (message) => emit(BeritaSuccessMessage(message: message)),
      );
    });
  }
}
