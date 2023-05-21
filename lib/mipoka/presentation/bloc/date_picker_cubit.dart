import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDatePickerCubit extends Cubit<DateTime?> {
  CustomDatePickerCubit() : super(null);

  void selectDate(DateTime date) {
    emit(date);
  }
}
