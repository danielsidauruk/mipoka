import 'package:mipoka/mipoka/domain/entities/panitia_peserta_laporan.dart';

class PanitiaPesertaLaporanModel extends PanitiaPesertaL {
  const PanitiaPesertaLaporanModel({
    required int idPanitiaPesertaLaporan,
    required int idLaporan,
    required String jenisMahasiswa,
    required String nim,
    required String namaLengkap,
    required String prodi,
    required String peran,
  }) : super(
    idPanitiaPesertaL: idPanitiaPesertaLaporan,
    idLaporan: idLaporan,
    jenisMahasiswa: jenisMahasiswa,
    nim: nim,
    namaLengkap: namaLengkap,
    prodi: prodi,
    peran: peran,
  );

  factory PanitiaPesertaLaporanModel.fromEntity(PanitiaPesertaL panitiaPesertaL) {
    return PanitiaPesertaLaporanModel(
      idPanitiaPesertaLaporan: panitiaPesertaL.idPanitiaPesertaL,
      idLaporan: panitiaPesertaL.idLaporan,
      jenisMahasiswa: panitiaPesertaL.jenisMahasiswa,
      nim: panitiaPesertaL.nim,
      namaLengkap: panitiaPesertaL.namaLengkap,
      prodi: panitiaPesertaL.prodi,
      peran: panitiaPesertaL.peran,
    );
  }

  factory PanitiaPesertaLaporanModel.fromJson(Map<String, dynamic> json) {
    return PanitiaPesertaLaporanModel(
      idPanitiaPesertaLaporan: json['idPanitiaPesertaLaporan'],
      idLaporan: json['idLaporan'],
      jenisMahasiswa: json['jenisMahasiswa'],
      nim: json['nim'],
      namaLengkap: json['namaLengkap'],
      prodi: json['prodi'],
      peran: json['peran'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPanitiaPesertaLaporan': idPanitiaPesertaL,
      'idLaporan': idLaporan,
      'jenisMahasiswa': jenisMahasiswa,
      'nim': nim,
      'namaLengkap': namaLengkap,
      'prodi': prodi,
      'peran': peran,
    };
  }
}
