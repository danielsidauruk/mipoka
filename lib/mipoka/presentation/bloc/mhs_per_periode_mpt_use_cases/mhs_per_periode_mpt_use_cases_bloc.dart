import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/mhs_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/mhs_per_periode_mpt_use_cases.dart';

part 'mhs_per_periode_mpt_use_cases_event.dart';
part 'mhs_per_periode_mpt_use_cases_state.dart';

class MhsPerPeriodeMptBloc extends Bloc<MhsPerPeriodeMptEvent, MhsPerPeriodeMptState> {
  final MhsPerPeriodeMptUseCases mhsPerPeriodeMptUseCase;

  MhsPerPeriodeMptBloc({required this.mhsPerPeriodeMptUseCase}) : super(MhsPerPeriodeMptEmpty()) {

    on<CreateMhsPerPeriodeMptEvent>((event, emit) async {
      emit(MhsPerPeriodeMptLoading());

      final result = await mhsPerPeriodeMptUseCase.createMhsPerPeriodeMpt(event.mhsPerPeriodeMpt);

      result.fold(
            (failure) => emit(MhsPerPeriodeMptError(message: failure.message)),
            (_) => emit(MhsPerPeriodeMptSuccess()),
      );
    });

    on<ReadAllMhsPerPeriodeMptEvent>((event, emit) async {
      emit(MhsPerPeriodeMptLoading());

      final result = await mhsPerPeriodeMptUseCase.readAllMhsPerPeriodeMpt(event.filter);

      result.fold(
            (failure) => emit(MhsPerPeriodeMptError(message: failure.message)),
            (mhsPerPeriodeMptList) => emit(AllMhsPerPeriodeMptHasData(mhsPerPeriodeMptList: mhsPerPeriodeMptList)),
      );
    });

    on<ReadMhsPerPeriodeMptEvent>((event, emit) async {
      emit(MhsPerPeriodeMptLoading());

      final result = await mhsPerPeriodeMptUseCase.readMhsPerPeriodeMpt(event.idMhsPerPeriodeMpt);

      result.fold(
            (failure) => emit(MhsPerPeriodeMptError(message: failure.message)),
            (mhsPerPeriodeMpt) => emit(MhsPerPeriodeMptHasData(mhsPerPeriodeMpt: mhsPerPeriodeMpt)),
      );
    });

    on<UpdateMhsPerPeriodeMptEvent>((event, emit) async {
      emit(MhsPerPeriodeMptLoading());

      final result = await mhsPerPeriodeMptUseCase.updateMhsPerPeriodeMpt(event.mhsPerPeriodeMpt);

      result.fold(
            (failure) => emit(MhsPerPeriodeMptError(message: failure.message)),
            (_) => emit(MhsPerPeriodeMptSuccess()),
      );
    });

    on<DeleteMhsPerPeriodeMptEvent>((event, emit) async {
      emit(MhsPerPeriodeMptLoading());

      final result = await mhsPerPeriodeMptUseCase.deleteMhsPerPeriodeMpt(event.idMhsPerPeriodeMpt);

      result.fold(
            (failure) => emit(MhsPerPeriodeMptError(message: failure.message)),
            (_) => emit(MhsPerPeriodeMptSuccess()),
      );
    });
  }
}