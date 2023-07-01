part of 'berita_bloc.dart';

abstract class BeritaEvent extends Equatable {
  const BeritaEvent();

  @override
  List<Object?> get props => [];
}

class CreateBeritaEvent extends BeritaEvent {
  final Berita berita;

  const CreateBeritaEvent(this.berita);
}

class ReadAllBeritaEvent extends BeritaEvent {
  final String filter;

  const ReadAllBeritaEvent({this.filter = "semua"});

  @override
  List<Object?> get props => [filter];
}

class ReadBeritaEvent extends BeritaEvent {
  final int idBerita;
  const ReadBeritaEvent(this.idBerita);
}

class UpdateBeritaEvent extends BeritaEvent {
  final Berita berita;
  const UpdateBeritaEvent(this.berita);
}

class DeleteBeritaEvent extends BeritaEvent {
  final int beritaId;
  const DeleteBeritaEvent(this.beritaId);
}
