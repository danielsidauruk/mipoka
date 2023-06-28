part of 'peserta_kegiatan_laporan_bloc.dart';

abstract class PesertaKegiatanLaporanEvent extends Equatable {
  const PesertaKegiatanLaporanEvent();

  @override
  List<Object> get props => [];
}

class ReadAllPesertaKegiatanLaporanEvent extends PesertaKegiatanLaporanEvent {}

class ReadPesertaKegiatanLaporanEvent extends PesertaKegiatanLaporanEvent {
  final int idPesertaKegiatanLaporan;

  const ReadPesertaKegiatanLaporanEvent({required this.idPesertaKegiatanLaporan});
}

class CreatePesertaKegiatanLaporanEvent extends PesertaKegiatanLaporanEvent {
  final int idUsulanKegiatan;
  final PesertaKegiatanLaporan pesertaKegiatanLaporan;

  const CreatePesertaKegiatanLaporanEvent({
    required this.idUsulanKegiatan,
    required this.pesertaKegiatanLaporan,
  });

  @override
  List<Object> get props => [pesertaKegiatanLaporan];
}

class UpdatePesertaKegiatanLaporanEvent extends PesertaKegiatanLaporanEvent {
  final PesertaKegiatanLaporan pesertaKegiatanLaporan;

  const UpdatePesertaKegiatanLaporanEvent(this.pesertaKegiatanLaporan);

  @override
  List<Object> get props => [pesertaKegiatanLaporan];
}

class DeletePesertaKegiatanLaporanEvent extends PesertaKegiatanLaporanEvent {
  final int idPesertaKegiatanLaporan;

  const DeletePesertaKegiatanLaporanEvent(this.idPesertaKegiatanLaporan);

  @override
  List<Object> get props => [idPesertaKegiatanLaporan];
}

