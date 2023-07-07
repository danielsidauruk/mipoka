part of 'mipoka_user_by_nim_bloc.dart';

abstract class MipokaUserByNimEvent extends Equatable {
  const MipokaUserByNimEvent();

  @override
  List<Object> get props => [];
}


class ReadMipokaUserByNimEvent extends MipokaUserByNimEvent {
  final String idUser;

  const ReadMipokaUserByNimEvent({required this.idUser});
}