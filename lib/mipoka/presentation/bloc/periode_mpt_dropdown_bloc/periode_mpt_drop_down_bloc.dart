import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/Periode_mpt_use_case.dart';

part 'periode_mpt_drop_down_event.dart';
part 'periode_mpt_drop_down_state.dart';

class PeriodeMptDropDownBloc extends Bloc<PeriodeMptDropDownEvent, PeriodeMptDropDownState> {
  final PeriodeMptUseCase periodeMptUseCase;

  PeriodeMptDropDownBloc({required this.periodeMptUseCase}) : super(PeriodeMptDropDownEmpty()) {
    on<ReadPeriodeMptDropDownEvent>((event, emit) async {
      emit(PeriodeMptDropDownLoading());

      final result = await periodeMptUseCase.readAllPeriodeMpt();

      result.fold(
            (failure) => emit(PeriodeMptDropDownError(message: failure.message)),
            (periodeMptList) => emit(PeriodeMptDropDownHasData(periodeMptList: periodeMptList)),
      );
    });
  }
}
