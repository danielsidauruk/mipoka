import 'package:flutter_bloc/flutter_bloc.dart';

// Membuat event untuk mengubah nilai dropdown
class DropdownEvent {
  final String value;
  DropdownEvent(this.value);
}

// Membuat Cubit untuk mengelola state dropdown
class DropdownCubit extends Cubit<String> {
  DropdownCubit(String initialValue) : super(initialValue);

  void setDropdownValue(String value) {
    emit(value);
  }
}
