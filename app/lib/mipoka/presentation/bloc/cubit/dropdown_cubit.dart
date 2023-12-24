import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownBloc extends Cubit<String> {
  DropdownBloc(String initialItem) : super(initialItem);

  void selectItem(String item) {
    emit(item);
  }
}
