import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/quil_editor_focus_cubit/quill_editor_focus_cubit.dart';

// class CustomRichTextField extends StatelessWidget {
//   final QuillController controller;
//
//   const CustomRichTextField({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => QuillEditorFocusCubit(),
//       child: Builder(
//         builder: (context) {
//           final focusNode = FocusNode();
//           final quillEditorFocusCubit = context.watch<QuillEditorFocusCubit>();
//
//           focusNode.addListener(() {
//             quillEditorFocusCubit.setFocus(focusNode.hasFocus);
//           });
//
//           return Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5.0),
//               border: Border.all(color: Colors.white),
//             ),
//             child: Column(
//               children: [
//                 BlocBuilder<QuillEditorFocusCubit, QuillEditorFocusState>(
//                   builder: (context, toolbarState) {
//                     return toolbarState.isFocused ?
//                     QuillToolbar.basic(
//                       controller: controller,
//                       axis: Axis.horizontal,
//                       multiRowsDisplay: false,
//                     ) : const Center();
//                   },
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   child: QuillEditor(
//                     controller: controller,
//                     focusNode: FocusNode(),
//                     readOnly: false,
//                     expands: false,
//                     padding: EdgeInsets.zero,
//                     scrollController: ScrollController(),
//                     scrollable: true,
//                     autoFocus: false,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CustomRichTextField extends StatelessWidget {
//   final QuillController controller;
//
//   const CustomRichTextField({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => QuillEditorFocusCubit(),
//       child: BlocBuilder<QuillEditorFocusCubit, QuillEditorFocusState>(
//         builder: (context, state) {
//           final focusNode = FocusNode();
//           focusNode.addListener(() {
//             context.read<QuillEditorFocusCubit>().setFocus(focusNode.hasFocus);
//           });
//
//           return Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5.0),
//               border: Border.all(color: Colors.white),
//             ),
//             child: Column(
//               children: [
//                 state.isFocused
//                     ? QuillToolbar.basic(
//                   controller: controller,
//                   axis: Axis.horizontal,
//                   multiRowsDisplay: false,
//                 ) :
//                 const SizedBox(),
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   child: QuillEditor(
//                     controller: controller,
//                     focusNode: focusNode,
//                     readOnly: false,
//                     expands: false,
//                     padding: EdgeInsets.zero,
//                     scrollController: ScrollController(),
//                     scrollable: true,
//                     autoFocus: false,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class CustomRichTextField extends StatelessWidget {
  final QuillController controller;

  const CustomRichTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuillEditorFocusCubit(),
      child: Builder(
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              children: [
                QuillToolbar.basic(
                  controller: controller,
                  axis: Axis.horizontal,
                  multiRowsDisplay: false,
                  showFontFamily: false,
                  showFontSize: false,
                  showHeaderStyle: false,
                  showCenterAlignment: false,
                  showQuote: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showBackgroundColorButton: false,
                  showDividers: false,
                  showRedo: false,
                  showUndo: false,
                  showSearchButton: false,
                  showSmallButton: false,
                  showDirection: false,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: QuillEditor(
                    controller: controller,
                    focusNode: FocusNode(),
                    readOnly: false,
                    expands: false,
                    padding: EdgeInsets.zero,
                    scrollController: ScrollController(),
                    scrollable: true,
                    autoFocus: false,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
