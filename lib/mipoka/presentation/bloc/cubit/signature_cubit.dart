import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class SignatureEvent {}
//
// class SignatureState {
//   final bool isSignatureVisible;
//   final String? savedSignatureUrl;
//
//   SignatureState({
//     this.isSignatureVisible = false,
//     this.savedSignatureUrl,
//   });
//
//   SignatureState copyWith({
//     bool? isSignatureVisible,
//     String? savedSignatureUrl,
//   }) {
//     return SignatureState(
//       isSignatureVisible: isSignatureVisible ?? this.isSignatureVisible,
//       savedSignatureUrl: savedSignatureUrl ?? this.savedSignatureUrl,
//     );
//   }
// }
//
// // class SignatureCubit extends Cubit<SignatureState> {
// //   SignatureCubit() : super(const SignatureState(isSignatureVisible: false));
// //
// //   void toggleSignature() {
// //     emit(state.copyWith(isSignatureVisible: !state.isSignatureVisible));
// //   }
// // }
//
// class SignatureCubit extends Cubit<SignatureState> {
//   SignatureCubit() : super(SignatureState());
//
//   void toggleSignature() {
//     // Toggle the visibility of the signature pad
//     emit(state.copyWith(isSignatureVisible: !state.isSignatureVisible));
//   }
//
//   void saveSignatureUrl(String? url) {
//     // Save the signature URL
//     emit(state.copyWith(savedSignatureUrl: url));
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';

class SignatureEvent {}

class SignatureState {
  final bool isSignatureVisible;

  SignatureState({required this.isSignatureVisible});

  SignatureState copyWith({bool? isSignatureVisible}) {
    return SignatureState(
      isSignatureVisible: isSignatureVisible ?? this.isSignatureVisible,
    );
  }
}

class SignatureCubit extends Cubit<SignatureState> {
  SignatureCubit() : super(SignatureState(isSignatureVisible: false));

  void toggleSignature() {
    emit(state.copyWith(isSignatureVisible: !state.isSignatureVisible));
  }
}