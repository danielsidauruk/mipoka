import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/periode_use_case.dart';

part 'periode_event.dart';
part 'periode_state.dart';

class PeriodeBloc extends Bloc<PeriodeEvent, PeriodeState> {
  final PeriodeUseCase periodeUseCase;

  PeriodeBloc({required this.periodeUseCase}) : super(PeriodeEmpty()) {
    on<ReadPeriodeEvent>((event, emit) async {
      emit(PeriodeLoading());

      final result = await periodeUseCase.readPeriode();

      result.fold(
            (failure) => emit(PeriodeError(message: failure.message)),
            (periodeList) => emit(PeriodeHasData(periodeList: periodeList)),
      );
    });

    on<CreatePeriodeEvent>((event, emit) async {
      emit(PeriodeLoading());

      final result = await periodeUseCase.createPeriode(event.periode);

      result.fold(
            (failure) => emit(PeriodeError(message: failure.message)),
            (message) => emit(PeriodeSuccessMessage(message: message)),
      );

      add(ReadPeriodeEvent());
    });

    on<UpdatePeriodeEvent>((event, emit) async {
      emit(PeriodeLoading());

      final result = await periodeUseCase.updatePeriode(event.periode);

      result.fold(
            (failure) => emit(PeriodeError(message: failure.message)),
            (message) => emit(PeriodeSuccessMessage(message: message)),
      );

      add(ReadPeriodeEvent());
    });

    on<DeletePeriodeEvent>((event, emit) async {
      emit(PeriodeLoading());

      final result = await periodeUseCase.deletePeriode(event.idPeriode);

      result.fold(
            (failure) => emit(PeriodeError(message: failure.message)),
            (message) => emit(PeriodeSuccessMessage(message: message)),
      );

      add(ReadPeriodeEvent());
    });
  }
}
