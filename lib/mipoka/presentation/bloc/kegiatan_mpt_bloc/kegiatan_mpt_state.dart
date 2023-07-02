part of 'kegiatan_mpt_bloc.dart';

abstract class KegiatanMptState extends Equatable {
  const KegiatanMptState();

  @override
  List<Object> get props => [];
}

class KegiatanMptEmpty extends KegiatanMptState {}

class KegiatanMptLoading extends KegiatanMptState {}

class KegiatanMptError extends KegiatanMptState {
  final String message;

  const KegiatanMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllKegiatanMptHasData extends KegiatanMptState {
  const AllKegiatanMptHasData({required this.kegiatanList});

  final List<KegiatanPerPeriodeMpt> kegiatanList;

  @override
  List<Object> get props => [kegiatanList];
}

class KegiatanMptHasData extends KegiatanMptState {
  const KegiatanMptHasData({required this.kegiatan});

  final KegiatanPerPeriodeMpt kegiatan;

  @override
  List<Object> get props => [kegiatan];
}

class KegiatanMptSuccessMessage extends KegiatanMptState {
  const KegiatanMptSuccessMessage({this.message = "Data has changed"});

  final String message;

  @override
  List<Object> get props => [message];
}
