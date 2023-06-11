import 'package:mipoka/mipoka/domain/entities/partisipan.dart';

class PartisipanModel extends Partisipan {
  const PartisipanModel({
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

  factory PartisipanModel.fromJson(Map<String, dynamic> json) {
    return PartisipanModel(
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
