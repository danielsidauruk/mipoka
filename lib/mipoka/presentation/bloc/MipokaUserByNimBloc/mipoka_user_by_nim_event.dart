part of 'mipoka_user_by_nim_bloc.dart';

abstract class MipokaUserByNimEvent extends Equatable {
  const MipokaUserByNimEvent();

  @override
  List<Object> get props => [];
}


class ReadMipokaUserByNim extends MipokaUserByNimEvent {
  final String nim;

  const ReadMipokaUserByNim({required this.nim});
}