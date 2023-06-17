part of 'kegiatan_bloc.dart';

abstract class KegiatanState extends Equatable {
  const KegiatanState();

  @override
  List<Object> get props => [];
}

class KegiatanEmpty extends KegiatanState {}

class KegiatanLoading extends KegiatanState {}

class KegiatanError extends KegiatanState {
  final String message;

  const KegiatanError({required this.message});

  @override
  List<Object> get props => [message];
}

class KegiatanHasData extends KegiatanState {
  const KegiatanHasData({required this.kegiatanList});

  final List<Kegiatan> kegiatanList;

  @override
  List<Object> get props => [kegiatanList];
}

class KegiatanSuccessMessage extends KegiatanState {
  const KegiatanSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
