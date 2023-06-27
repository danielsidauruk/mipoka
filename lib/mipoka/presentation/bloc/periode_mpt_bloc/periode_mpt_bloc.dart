import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/Periode_mpt_use_case.dart';

part 'periode_mpt_event.dart';
part 'periode_mpt_state.dart';

class PeriodeMptBloc extends Bloc<PeriodeMptEvent, PeriodeMptState> {
  final PeriodeMptUseCase periodeMptUseCase;

  PeriodeMptBloc({required this.periodeMptUseCase}) : super(PeriodeMptEmpty()) {
    on<ReadPeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.readAllPeriodeMpt();

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (periodeMptList) => emit(PeriodeMptHasData(periodeMptList: periodeMptList)),
      );
    });

    on<CreatePeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.createPeriodeMpt(event.periodeMpt);

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (message) => emit(PeriodeMptSuccessMessage(message: message)),
      );

      add(ReadPeriodeMptEvent());
    });

    on<UpdatePeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.updatePeriode(event.periodeMpt);

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (message) => emit(PeriodeMptSuccessMessage(message: message)),
      );

      add(ReadPeriodeMptEvent());
    });

    on<DeletePeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.deletePeriode(event.idPeriodeMpt);

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (message) => emit(PeriodeMptSuccessMessage(message: message)),
      );

      add(ReadPeriodeMptEvent());
    });
  }
}
