part of 'kegiatan_per_periode_mpt_bloc.dart';

abstract class KegiatanPerPeriodeMptEvent extends Equatable {
  const KegiatanPerPeriodeMptEvent();

  @override
  List<Object?> get props => [];
}

class CreateKegiatanPerPeriodeMptEvent extends KegiatanPerPeriodeMptEvent {
  final KegiatanPerPeriodeMpt kegiatanPerPeriodeMpt;

  const CreateKegiatanPerPeriodeMptEvent({required this.kegiatanPerPeriodeMpt});

  @override
  List<Object?> get props => [kegiatanPerPeriodeMpt];
}

class ReadAllKegiatanPerPeriodeMptEvent extends KegiatanPerPeriodeMptEvent {
  final String filter;

  const ReadAllKegiatanPerPeriodeMptEvent({this.filter = "semua"});
}

class ReadKegiatanPerPeriodeMptEvent extends KegiatanPerPeriodeMptEvent {
  final int idKegiatanPerPeriodeMpt;

  const ReadKegiatanPerPeriodeMptEvent({required this.idKegiatanPerPeriodeMpt});
}

class UpdateKegiatanPerPeriodeMptEvent extends KegiatanPerPeriodeMptEvent {
  final KegiatanPerPeriodeMpt kegiatanPerPeriodeMpt;

  const UpdateKegiatanPerPeriodeMptEvent({required this.kegiatanPerPeriodeMpt});

  @override
  List<Object?> get props => [kegiatanPerPeriodeMpt];
}

class DeleteKegiatanPerPeriodeMptEvent extends KegiatanPerPeriodeMptEvent {
  final int idKegiatanPerPeriodeMpt;

  const DeleteKegiatanPerPeriodeMptEvent({required this.idKegiatanPerPeriodeMpt});

  @override
  List<Object?> get props => [idKegiatanPerPeriodeMpt];
}
