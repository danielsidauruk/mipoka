import 'package:mipoka/mipoka/domain/entities/peserta.dart';

class PesertaModel extends Peserta {
  PesertaModel({
    required int idPeserta,
    required int idUsulan,
    required String nim,
    required String namaLengkap,
    required String nik,
    required String tempatLahir,
    required String tanggalLahir,
    required String peran,
    required String dasarKirim,
  }) : super(
    idPeserta: idPeserta,
    idUsulan: idUsulan,
    nim: nim,
    namaLengkap: namaLengkap,
    nik: nik,
    tempatLahir: tempatLahir,
    tanggalLahir: tanggalLahir,
    peran: peran,
    dasarKirim: dasarKirim,
  );

  factory PesertaModel.fromEntity(Peserta peserta) {
    return PesertaModel(
      idPeserta: peserta.idPeserta,
      idUsulan: peserta.idUsulan,
      nim: peserta.nim,
      namaLengkap: peserta.namaLengkap,
      nik: peserta.nik,
      tempatLahir: peserta.tempatLahir,
      tanggalLahir: peserta.tanggalLahir,
      peran: peserta.peran,
      dasarKirim: peserta.dasarKirim,
    );
  }

  factory PesertaModel.fromJson(Map<String, dynamic> json) {
    return PesertaModel(
      idPeserta: json['idPeserta'],
      idUsulan: json['idUsulan'],
      nim: json['nim'],
      namaLengkap: json['namaLengkap'],
      nik: json['nik'],
      tempatLahir: json['tempatLahir'],
      tanggalLahir: json['tanggalLahir'],
      peran: json['peran'],
      dasarKirim: json['dasarKirim'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPeserta': idPeserta,
      'idUsulan': idUsulan,
      'nim': nim,
      'namaLengkap': namaLengkap,
      'nik': nik,
      'tempatLahir': tempatLahir,
      'tanggalLahir': tanggalLahir,
      'peran': peran,
      'dasarKirim': dasarKirim,
    };
  }
}
