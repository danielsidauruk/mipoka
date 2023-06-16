import 'package:mipoka/mipoka/domain/entities/prestasi.dart';

class PrestasiModel extends Prestasi {
  const PrestasiModel({
    required int idPrestasi,
    required String nim,
    required String namaLengkap,
    required String kegiatan,
    required String tingkat,
    required String prestasiDicapai,
  }) : super(
    idPrestasi: idPrestasi,
    nim: nim,
    namaLengkap: namaLengkap,
    kegiatan: kegiatan,
    tingkat: tingkat,
    prestasiDicapai: prestasiDicapai,
  );

  factory PrestasiModel.fromEntity(Prestasi prestasi) {
    return PrestasiModel(
      idPrestasi: prestasi.idPrestasi,
      nim: prestasi.nim,
      namaLengkap: prestasi.namaLengkap,
      kegiatan: prestasi.kegiatan,
      tingkat: prestasi.tingkat,
      prestasiDicapai: prestasi.prestasiDicapai,
    );
  }

  factory PrestasiModel.fromJson(Map<String, dynamic> json) {
    return PrestasiModel(
      idPrestasi: json['idPrestasi'],
      nim: json['nim'],
      namaLengkap: json['namaLengkap'],
      kegiatan: json['kegiatan'],
      tingkat: json['tingkat'],
      prestasiDicapai: json['prestasiDicapai'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPrestasi': idPrestasi,
      'nim': nim,
      'namaLengkap': namaLengkap,
      'kegiatan': kegiatan,
      'tingkat': tingkat,
      'prestasiDicapai': prestasiDicapai,
    };
  }
}
