import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'mipoka_user_by_nim_event.dart';
part 'mipoka_user_by_nim_state.dart';

class MipokaUserByNimBloc extends Bloc<MipokaUserByNimEvent, MipokaUserByNimState> {
  MipokaUserByNimBloc() : super(MipokaUserByNimInitial()) {
    on<MipokaUserByNimEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
