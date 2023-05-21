import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/enum.dart';

class SwitchCubit extends Cubit<SwitchItems> {
  SwitchCubit() : super(SwitchItems.daring);

  void toggleBentukKegiatan() {
    emit(state == SwitchItems.daring ? SwitchItems.luring : SwitchItems.daring);
  }
}
