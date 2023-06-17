part of 'riwayat_mpt_bloc.dart';

abstract class RiwayatMptEvent extends Equatable {
  const RiwayatMptEvent();

  @override
  List<Object> get props => [];
}

class ReadRiwayatMptEvent extends RiwayatMptEvent {}

class CreateRiwayatMptEvent extends RiwayatMptEvent {
  final RiwayatMpt riwayatMpt;

  const CreateRiwayatMptEvent({required this.riwayatMpt});

  @override
  List<Object> get props => [riwayatMpt];
}

class UpdateRiwayatMptEvent extends RiwayatMptEvent {
  final RiwayatMpt riwayatMpt;

  const UpdateRiwayatMptEvent({required this.riwayatMpt});

  @override
  List<Object> get props => [riwayatMpt];
}

class DeleteRiwayatMptEvent extends RiwayatMptEvent {
  final int idRiwayatMpt;

  const DeleteRiwayatMptEvent({required this.idRiwayatMpt});

  @override
  List<Object> get props => [idRiwayatMpt];
}
