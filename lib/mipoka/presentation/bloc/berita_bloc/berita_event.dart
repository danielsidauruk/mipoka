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

class ReadBeritaEvent extends BeritaEvent {}

class UpdateBeritaEvent extends BeritaEvent {
  final Berita berita;
  const UpdateBeritaEvent(this.berita);
}

class DeleteBeritaEvent extends BeritaEvent {
  final int beritaId;
  const DeleteBeritaEvent(this.beritaId);
}