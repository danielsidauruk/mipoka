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

      final result = await partisipanUseCase.createPartisipan(
        idUsulanKegiatan: event.idUsulanKegiatan,
        partisipan: event.partisipan,
      );

      result.fold(
            (failure) => emit(PartisipanError(message: failure.message)),
            (_) => emit(const PartisipanSuccessMessage()),
      );
    });

    on<UpdatePartisipanEvent>((event, emit) async {
      emit(PartisipanLoading());

      final result = await partisipanUseCase.updatePartisipan(event.partisipan);

      result.fold(
            (failure) => emit(PartisipanError(message: failure.message)),
            (_) => emit(const PartisipanSuccessMessage()),
      );
    });

    on<DeletePartisipanEvent>((event, emit) async {
      emit(PartisipanLoading());

      final result = await partisipanUseCase.deletePartisipan(event.idPartisipan);

      result.fold(
            (failure) => emit(PartisipanError(message: failure.message)),
            (_) => emit(const PartisipanSuccessMessage()),
      );
    });
  }
}
