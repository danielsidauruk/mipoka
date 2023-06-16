import 'package:mipoka/mipoka/domain/entities/rincian_laporan.dart';

class RincianLaporanModel extends RincianLaporan {
  const RincianLaporanModel({
    required int idRincianLaporan,
    required int idLaporan,
    required String keteranganA,
    required int qty,
    required int satuan,
    required int usulanAnggaran,
    required int realisasiAnggaran,
    required int selisih,
  }) : super(
    idRincianL: idRincianLaporan,
    idLaporan: idLaporan,
    keteranganA: keteranganA,
    qty: qty,
    satuan: satuan,
    usulanAnggaran: usulanAnggaran,
    realisasiAnggaran: realisasiAnggaran,
    selisih: selisih,
  );

  factory RincianLaporanModel.fromEntity(RincianLaporan rincianLaporan) {
    return RincianLaporanModel(
      idRincianLaporan: rincianLaporan.idRincianL,
      idLaporan: rincianLaporan.idLaporan,
      keteranganA: rincianLaporan.keteranganA,
      qty: rincianLaporan.qty,
      satuan: rincianLaporan.satuan,
      usulanAnggaran: rincianLaporan.usulanAnggaran,
      realisasiAnggaran: rincianLaporan.realisasiAnggaran,
      selisih: rincianLaporan.selisih,
    );
  }

  factory RincianLaporanModel.fromJson(Map<String, dynamic> json) {
    return RincianLaporanModel(
      idRincianLaporan: json['idRincianLaporan'],
      idLaporan: json['idLaporan'],
      keteranganA: json['keteranganA'],
      qty: json['qty'],
      satuan: json['satuan'],
      usulanAnggaran: json['usulanAnggaran'],
      realisasiAnggaran: json['realisasiAnggaran'],
      selisih: json['selisih'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idRincianLaporan': idRincianL,
      'idLaporan': idLaporan,
      'keteranganA': keteranganA,
      'qty': qty,
      'satuan': satuan,
      'usulanAnggaran': usulanAnggaran,
      'realisasiAnggaran': realisasiAnggaran,
      'selisih': selisih,
    };
  }
}
