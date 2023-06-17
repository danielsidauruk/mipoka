part of 'panitia_peserta_laporan_bloc.dart';

abstract class PanitiaPesertaLaporanEvent extends Equatable {
  const PanitiaPesertaLaporanEvent();

  @override
  List<Object?> get props => [];
}

class CreatePanitiaPesertaLaporanEvent extends PanitiaPesertaLaporanEvent {
  final PanitiaPesertaLaporan panitiaPesertaLaporan;

  const CreatePanitiaPesertaLaporanEvent(this.panitiaPesertaLaporan);

  @override
  List<Object?> get props => [panitiaPesertaLaporan];
}

class ReadPanitiaPesertaLaporanEvent extends PanitiaPesertaLaporanEvent {}

class UpdatePanitiaPesertaLaporanEvent extends PanitiaPesertaLaporanEvent {
  final PanitiaPesertaLaporan panitiaPesertaLaporan;

  const UpdatePanitiaPesertaLaporanEvent(this.panitiaPesertaLaporan);

  @override
  List<Object?> get props => [panitiaPesertaLaporan];
}

class DeletePanitiaPesertaLaporanEvent extends PanitiaPesertaLaporanEvent {
  final int idPanitiaPesertaLaporan;

  const DeletePanitiaPesertaLaporanEvent(this.idPanitiaPesertaLaporan);

  @override
  List<Object?> get props => [idPanitiaPesertaLaporan];
}
