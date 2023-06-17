part of 'lampiran_laporan_bloc.dart';

abstract class LampiranLaporanEvent extends Equatable {
  const LampiranLaporanEvent();

  @override
  List<Object?> get props => [];
}

class CreateLampiranLaporanEvent extends LampiranLaporanEvent {
  final LampiranLaporan lampiranLaporan;

  const CreateLampiranLaporanEvent(this.lampiranLaporan);

  @override
  List<Object?> get props => [lampiranLaporan];
}

class ReadLampiranLaporanEvent extends LampiranLaporanEvent {}

class UpdateLampiranLaporanEvent extends LampiranLaporanEvent {
  final LampiranLaporan lampiranLaporan;

  const UpdateLampiranLaporanEvent(this.lampiranLaporan);

  @override
  List<Object?> get props => [lampiranLaporan];
}

class DeleteLampiranLaporanEvent extends LampiranLaporanEvent {
  final int idLampiranLaporan;

  const DeleteLampiranLaporanEvent(this.idLampiranLaporan);

  @override
  List<Object?> get props => [idLampiranLaporan];
}
