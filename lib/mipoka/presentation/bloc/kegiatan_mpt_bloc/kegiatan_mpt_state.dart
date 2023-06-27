part of 'kegiatan_mpt_bloc.dart';

abstract class KegiatanMptState extends Equatable {
  const KegiatanMptState();

  @override
  List<Object> get props => [];
}

class KegiatanEmpty extends KegiatanMptState {}

class KegiatanLoading extends KegiatanMptState {}

class KegiatanError extends KegiatanMptState {
  final String message;

  const KegiatanError({required this.message});

  @override
  List<Object> get props => [message];
}

class KegiatanHasData extends KegiatanMptState {
  const KegiatanHasData({required this.kegiatanList});

  final List<Kegiatan> kegiatanList;

  @override
  List<Object> get props => [kegiatanList];
}

class KegiatanSuccessMessage extends KegiatanMptState {
  const KegiatanSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
