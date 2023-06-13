import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimePickerCubit extends Cubit<TimeOfDay?> {
  TimePickerCubit() : super(null);

  void setTime(TimeOfDay time) {
    emit(time);
  }
}
