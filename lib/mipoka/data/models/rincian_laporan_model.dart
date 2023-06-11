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
    idRincianLaporan: idRincianLaporan,
    idLaporan: idLaporan,
    keteranganA: keteranganA,
    qty: qty,
    satuan: satuan,
    usulanAnggaran: usulanAnggaran,
    realisasiAnggaran: realisasiAnggaran,
    selisih: selisih,
  );

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
      'idRincianLaporan': idRincianLaporan,
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
