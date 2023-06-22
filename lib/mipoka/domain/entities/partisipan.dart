import 'package:equatable/equatable.dart';

// Just updated
class Partisipan extends Equatable{
  final int idPartisipan;
  final String nim;
  final String namaLengkap;
  final String nik;
  final String tempatLahir;
  final String tglLahir;
  final String peran;
  final String dasarKirim;

  const Partisipan({
    required this.idPartisipan,
    required this.nim,
    required this.namaLengkap,
    required this.nik,
    required this.tempatLahir,
    required this.tglLahir,
    required this.peran,
    required this.dasarKirim,
  });

  Partisipan copyWith({
    int? idPartisipan,
    String? nim,
    String? namaLengkap,
    String? nik,
    String? tempatLahir,
    String? tglLahir,
    String? peran,
    String? dasarKirim,
  }) =>
      Partisipan(
        idPartisipan: idPartisipan ?? this.idPartisipan,
        nim: nim ?? this.nim,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        nik: nik ?? this.nik,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tglLahir: tglLahir ?? this.tglLahir,
        peran: peran ?? this.peran,
        dasarKirim: dasarKirim ?? this.dasarKirim,
      );

  @override
  List<Object?> get props => [
    idPartisipan,
    nim,
    namaLengkap,
    nik,
    tempatLahir,
    tglLahir,
    peran,
    dasarKirim,
  ];
}
