import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/riwayat_mpt_use_case.dart';

part 'riwayat_mpt_event.dart';
part 'riwayat_mpt_state.dart';

class RiwayatMptBloc extends Bloc<RiwayatMptEvent, RiwayatMptState> {
  final RiwayatMptUseCase riwayatMptUseCase;

  RiwayatMptBloc({required this.riwayatMptUseCase}) : super(RiwayatMptEmpty()) {
    on<ReadRiwayatMptEvent>((event, emit) async {
      emit(RiwayatMptLoading());

      final result = await riwayatMptUseCase.readRiwayatMpt();

      result.fold(
            (failure) => emit(RiwayatMptError(message: failure.message)),
            (riwayatMptList) =>
            emit(RiwayatMptHasData(riwayatMptList: riwayatMptList)),
      );
    });

    on<CreateRiwayatMptEvent>((event, emit) async {
      emit(RiwayatMptLoading());

      final result =
      await riwayatMptUseCase.createRiwayatMpt(event.riwayatMpt);

      result.fold(
            (failure) => emit(RiwayatMptError(message: failure.message)),
            (message) => emit(RiwayatMptSuccessMessage(message: message)),
      );

      add(ReadRiwayatMptEvent());
    });

    on<UpdateRiwayatMptEvent>((event, emit) async {
      emit(RiwayatMptLoading());

      final result =
      await riwayatMptUseCase.updateRiwayatMpt(event.riwayatMpt);

      result.fold(
            (failure) => emit(RiwayatMptError(message: failure.message)),
            (message) => emit(RiwayatMptSuccessMessage(message: message)),
      );

      add(ReadRiwayatMptEvent());
    });

    on<DeleteRiwayatMptEvent>((event, emit) async {
      emit(RiwayatMptLoading());

      final result =
      await riwayatMptUseCase.deleteRiwayatMpt(event.idRiwayatMpt);

      result.fold(
            (failure) => emit(RiwayatMptError(message: failure.message)),
            (message) => emit(RiwayatMptSuccessMessage(message: message)),
      );

      add(ReadRiwayatMptEvent());
    });
  }
}
