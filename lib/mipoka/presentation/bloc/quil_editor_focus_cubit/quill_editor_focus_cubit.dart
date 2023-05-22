import 'package:flutter_bloc/flutter_bloc.dart';
import 'quill_editor_focus_state.dart';

class QuillEditorFocusCubit extends Cubit<QuillEditorFocusState> {
  QuillEditorFocusCubit() : super(QuillEditorFocusState(false));

  void setFocus(bool isFocused) {
    emit(QuillEditorFocusState(isFocused));
  }
}
