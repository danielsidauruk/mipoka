import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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