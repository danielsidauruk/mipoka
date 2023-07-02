part of 'kegiatan_per_periode_mpt_bloc.dart';

abstract class KegiatanPerPeriodeMptState extends Equatable {
  const KegiatanPerPeriodeMptState();

  @override
  List<Object> get props => [];
}

class KegiatanPerPeriodeMptEmpty extends KegiatanPerPeriodeMptState {}

class KegiatanPerPeriodeMptLoading extends KegiatanPerPeriodeMptState {}

class KegiatanPerPeriodeMptError extends KegiatanPerPeriodeMptState {
  final String message;

  const KegiatanPerPeriodeMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllKegiatanPerPeriodeMptHasData extends KegiatanPerPeriodeMptState {
  const AllKegiatanPerPeriodeMptHasData({required this.kegiatanPerPeriodeMptList});

  final List<KegiatanPerPeriodeMpt> kegiatanPerPeriodeMptList;

  @override
  List<Object> get props => [kegiatanPerPeriodeMptList];
}

class KegiatanPerPeriodeMptHasData extends KegiatanPerPeriodeMptState {
  const KegiatanPerPeriodeMptHasData({required this.kegiatan});

  final KegiatanPerPeriodeMpt kegiatan;

  @override
  List<Object> get props => [kegiatan];
}

class KegiatanPerPeriodeMptSuccessMessage extends KegiatanPerPeriodeMptState {
  const KegiatanPerPeriodeMptSuccessMessage({this.message = "Data has changed"});

  final String message;

  @override
  List<Object> get props => [message];
}
