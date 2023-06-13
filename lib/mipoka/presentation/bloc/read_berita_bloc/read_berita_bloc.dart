import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mipoka/core/use_case.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/use_cases/read_berita.dart';

part 'read_berita_event.dart';
part 'read_berita_state.dart';

class ReadBeritaBloc extends Bloc<ReadBeritaEvent, ReadBeritaState> {
  final ReadBerita readBerita;

  ReadBeritaBloc({required this.readBerita}) : super(ReadBeritaEmpty()) {
    on<LoadBeritaEvent>((event, emit) async {
      emit (ReadBeritaLoading());

      final berita = await readBerita.call(NoParams());

      berita.fold(
            (failure) => emit(ReadBeritaError(message: failure.message)),
            (berita) => emit(ReadBeritaHasData(berita: berita)),
      );
    });
  }
}
