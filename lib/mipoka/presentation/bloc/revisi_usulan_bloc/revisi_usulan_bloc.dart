import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';
import 'package:mipoka/mipoka/domain/use_cases/revisi_usulan_use_case.dart';

part 'revisi_usulan_event.dart';
part 'revisi_usulan_state.dart';

class RevisiUsulanBloc extends Bloc<RevisiUsulanEvent, RevisiUsulanState> {
  final RevisiUsulanUseCase revisiUsulanUseCase;

  RevisiUsulanBloc({required this.revisiUsulanUseCase}) : super(RevisiUsulanEmpty()) {

    on<ReadRevisiUsulanEvent>((event, emit) async {
      emit(RevisiUsulanLoading());

      final result = await revisiUsulanUseCase.readRevisiUsulan(event.idRevisiUsulan);

      result.fold(
            (failure) => emit(RevisiUsulanError(message: failure.message)),
            (revisiUsulan) => emit(RevisiUsulanHasData(revisiUsulan: revisiUsulan)),
      );
    });

    on<CreateRevisiUsulanEvent>((event, emit) async {
      emit(RevisiUsulanLoading());

      final result = await revisiUsulanUseCase.createRevisiUsulan(event.revisiUsulan);

      result.fold(
            (failure) => emit(RevisiUsulanError(message: failure.message)),
            (_) => emit(const RevisiUsulanSuccess()),
      );
    });

    on<UpdateRevisiUsulanEvent>((event, emit) async {
      emit(RevisiUsulanLoading());

      final result = await revisiUsulanUseCase.updateRevisiUsulan(event.revisiUsulan);

      result.fold(
            (failure) => emit(RevisiUsulanError(message: failure.message)),
            (_) => emit(const RevisiUsulanSuccess()),
      );
    });

    on<DeleteRevisiUsulanEvent>((event, emit) async {
      emit(RevisiUsulanLoading());

      final result = await revisiUsulanUseCase.deleteRevisiUsulan(event.idRevisiUsulan);

      result.fold(
            (failure) => emit(RevisiUsulanError(message: failure.message)),
            (_) => emit(const RevisiUsulanSuccess()),
      );
    });
  }
}
