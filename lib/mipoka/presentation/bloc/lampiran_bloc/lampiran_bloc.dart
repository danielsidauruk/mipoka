import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran.dart';
import 'package:mipoka/mipoka/domain/use_cases/lampiran_use_case.dart';

part 'lampiran_event.dart';
part 'lampiran_state.dart';

class LampiranBloc extends Bloc<LampiranEvent, LampiranState> {
  final LampiranUseCase lampiranUseCase;

  LampiranBloc({required this.lampiranUseCase}) : super(LampiranEmpty()) {
    on<CreateLampiranEvent>((event, emit) async {
      emit(LampiranLoading());

      final result = await lampiranUseCase.createLampiran(event.lampiran);

      result.fold(
            (failure) => emit(LampiranError(message: failure.message)),
            (message) => emit(LampiranSuccessMessage(message: message)),
      );

      add(ReadLampiranEvent());
    });

    on<ReadLampiranEvent>((event, emit) async {
      emit(LampiranLoading());

      final result = await lampiranUseCase.readLampiran();

      result.fold(
            (failure) => emit(LampiranError(message: failure.message)),
            (lampiranList) => emit(LampiranHasData(lampiranList: lampiranList)),
      );
    });

    on<UpdateLampiranEvent>((event, emit) async {
      emit(LampiranLoading());

      final result = await lampiranUseCase.updateLampiran(event.lampiran);

      result.fold(
            (failure) => emit(LampiranError(message: failure.message)),
            (message) => emit(LampiranSuccessMessage(message: message)),
      );

      add(ReadLampiranEvent());
    });

    on<DeleteLampiranEvent>((event, emit) async {
      emit(LampiranLoading());

      final result = await lampiranUseCase.deleteLampiran(event.idLampiran);

      result.fold(
            (failure) => emit(LampiranError(message: failure.message)),
            (message) => emit(LampiranSuccessMessage(message: message)),
      );

      add(ReadLampiranEvent());
    });
  }
}
