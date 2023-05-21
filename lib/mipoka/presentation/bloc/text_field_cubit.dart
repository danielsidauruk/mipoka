import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldCubit extends Cubit<String> {
  TextFieldCubit() : super('');

  void setTextFieldValue(String value) {
    emit(value);
  }
}
