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

class KegiatanMptHasData extends KegiatanMptState {
  const KegiatanMptHasData({required this.kegiatanList});

  final List<KegiatanMpt> kegiatanList;

  @override
  List<Object> get props => [kegiatanList];
}

class KegiatanMptSuccessMessage extends KegiatanMptState {
  const KegiatanMptSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
