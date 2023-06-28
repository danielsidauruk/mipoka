import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/use_cases/partisipan_use_case.dart';

part 'partisipan_event.dart';
part 'partisipan_state.dart';

class PartisipanBloc extends Bloc<PartisipanEvent, PartisipanState> {
  final PartisipanUseCase partisipanUseCase;

  PartisipanBloc({required this.partisipanUseCase}) : super(PartisipanEmpty()) {

    on<CreatePartisipanEvent>((event, emit) async {
      emit(PartisipanLoading());

      final result = await partisipanUseCase.createPartisipan(event.partisipan);

      result.fold(
            (failure) => emit(PartisipanError(message: failure.message)),
            (message) => emit(PartisipanSuccessMessage(message: message)),
      );

      add(ReadAllPartisipanEvent());
    });

    on<UpdatePartisipanEvent>((event, emit) async {
      emit(PartisipanLoading());

      final result = await partisipanUseCase.updatePartisipan(event.partisipan);

      result.fold(
            (failure) => emit(PartisipanError(message: failure.message)),
            (message) => emit(PartisipanSuccessMessage(message: message)),
      );

      add(ReadAllPartisipanEvent());
    });

    on<DeletePartisipanEvent>((event, emit) async {
      emit(PartisipanLoading());

      final result = await partisipanUseCase.deletePartisipan(event.idPartisipan);

      result.fold(
            (failure) => emit(PartisipanError(message: failure.message)),
            (message) => emit(PartisipanSuccessMessage(message: message)),
      );

      add(ReadAllPartisipanEvent());
    });
  }
}
