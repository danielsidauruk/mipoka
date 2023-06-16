import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';

class Partisipan extends Equatable {
  final int idPeserta;
  final int idUsulan;
  final String nim;
  final String namaLengkap;
  final String nik;
  final String tempatLahir;
  final String tanggalLahir;
  final String peran;
  final String dasarKirim;

  const Partisipan({
    required this.idPeserta,
    required this.idUsulan,
    required this.nim,
    required this.namaLengkap,
    required this.nik,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.peran,
    required this.dasarKirim,
  });

  Partisipan updateWith({
    int? idPeserta,
    int? idUsulan,
    String? nim,
    String? namaLengkap,
    String? nik,
    String? tempatLahir,
    String? tanggalLahir,
    String? peran,
    String? dasarKirim,
  }) {
    return Partisipan(
      idPeserta: idPeserta ?? this.idPeserta,
      idUsulan: idUsulan ?? this.idUsulan,
      nim: nim ?? this.nim,
      namaLengkap: namaLengkap ?? this.namaLengkap,
      nik: nik ?? this.nik,
      tempatLahir: tempatLahir ?? this.tempatLahir,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      peran: peran ?? this.peran,
      dasarKirim: dasarKirim ?? this.dasarKirim,
    );
  }

  @override
  List<Object?> get props => [
    idPeserta,
    idUsulan,
    nim,
    namaLengkap,
    nik,
    tempatLahir,
    tanggalLahir,
    peran,
    dasarKirim,
  ];
}
