import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/Periode_mpt_use_case.dart';

part 'periode_mpt_event.dart';
part 'periode_mpt_state.dart';

class PeriodeMptBloc extends Bloc<PeriodeMptEvent, PeriodeMptState> {
  final PeriodeMptUseCase periodeMptUseCase;

  PeriodeMptBloc({required this.periodeMptUseCase}) : super(PeriodeMptEmpty()) {

    on<ReadAllPeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.readAllPeriodeMpt();

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (periodeMptList) => emit(AllPeriodeMptHasData(periodeMptList: periodeMptList)),
      );
    });

    on<ReadPeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.readPeriodeMpt(event.idPeriodeMpt);

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (periodeMpt) => emit(PeriodeMptHasData(periodeMpt: periodeMpt)),
      );
    });

    on<CreatePeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.createPeriodeMpt(event.periodeMpt);

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (message) => emit(PeriodeMptSuccessMessage(message: message)),
      );

      add(ReadAllPeriodeMptEvent());
    });

    on<UpdatePeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.updatePeriode(event.periodeMpt);

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (message) => emit(PeriodeMptSuccessMessage(message: message)),
      );

      add(ReadAllPeriodeMptEvent());
    });

    on<DeletePeriodeMptEvent>((event, emit) async {
      emit(PeriodeMptLoading());

      final result = await periodeMptUseCase.deletePeriode(event.idPeriodeMpt);

      result.fold(
            (failure) => emit(PeriodeMptError(message: failure.message)),
            (message) => emit(PeriodeMptSuccessMessage(message: message)),
      );

      add(ReadAllPeriodeMptEvent());
    });
  }
}
