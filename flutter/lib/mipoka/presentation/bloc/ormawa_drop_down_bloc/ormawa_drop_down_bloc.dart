import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/use_cases/ormawa_use_case.dart';

part 'ormawa_drop_down_event.dart';
part 'ormawa_drop_down_state.dart';

class OrmawaDropDownBloc extends Bloc<OrmawaDropDownEvent, OrmawaDropDownState> {
  final OrmawaUseCase ormawaUseCase;

  OrmawaDropDownBloc({required this.ormawaUseCase}) : super(OrmawaDropDownEmpty()) {

    on<ReadOrmawaDropDownEvent>((event, emit) async {
      emit(OrmawaDropDownLoading());

      final result = await ormawaUseCase.readAllOrmawa();

      result.fold(
            (failure) => emit(OrmawaDropDownError(message: failure.message)),
            (ormawaList) => emit(OrmawaDropDownHasData(ormawaList: ormawaList)),
      );
    });
  }
}
