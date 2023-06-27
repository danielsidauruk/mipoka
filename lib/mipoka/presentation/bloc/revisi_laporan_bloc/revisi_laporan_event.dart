part of 'revisi_laporan_bloc.dart';

abstract class RevisiLaporanEvent extends Equatable {
  const RevisiLaporanEvent();

  @override
  List<Object?> get props => [];
}

class ReadRevisiLaporanEvent extends RevisiLaporanEvent {
  final int idRevisiLaporan;

  const ReadRevisiLaporanEvent({required this.idRevisiLaporan});

  @override
  List<Object?> get props => [idRevisiLaporan];
}

class CreateRevisiLaporanEvent extends RevisiLaporanEvent {
  final RevisiLaporan revisiLaporan;

  const CreateRevisiLaporanEvent(this.revisiLaporan);

  @override
  List<Object?> get props => [revisiLaporan];
}

class UpdateRevisiLaporanEvent extends RevisiLaporanEvent {
  final RevisiLaporan revisiLaporan;

  const UpdateRevisiLaporanEvent(this.revisiLaporan);

  @override
  List<Object?> get props => [revisiLaporan];
}

class DeleteRevisiLaporanEvent extends RevisiLaporanEvent {
  final int idRevisiLaporan;

  const DeleteRevisiLaporanEvent(this.idRevisiLaporan);

  @override
  List<Object?> get props => [idRevisiLaporan];
}
