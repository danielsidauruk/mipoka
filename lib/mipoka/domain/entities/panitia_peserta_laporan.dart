import 'package:equatable/equatable.dart';

//=> Just updated
class PanitiaPesertaLaporan extends Equatable {
  final int idPanitiaPesertaL;
  final int idLaporan;
  final String jenisMahasiswa;
  final String nim;
  final String namaLengkap;
  final String prodi;
  final String peran;

  const PanitiaPesertaLaporan({
    required this.idPanitiaPesertaL,
    required this.idLaporan,
    required this.jenisMahasiswa,
    required this.nim,
    required this.namaLengkap,
    required this.prodi,
    required this.peran,
  });

  PanitiaPesertaLaporan updateWith({
    int? idPanitiaPesertaL,
    int? idLaporan,
    String? jenisMahasiswa,
    String? nim,
    String? namaLengkap,
    String? prodi,
    String? peran,
  }) {
    return PanitiaPesertaLaporan(
      idPanitiaPesertaL: idPanitiaPesertaL ?? this.idPanitiaPesertaL,
      idLaporan: idLaporan ?? this.idLaporan,
      jenisMahasiswa: jenisMahasiswa ?? this.jenisMahasiswa,
      nim: nim ?? this.nim,
      namaLengkap: namaLengkap ?? this.namaLengkap,
      prodi: prodi ?? this.prodi,
      peran: peran ?? this.peran,
    );
  }

  @override
  List<Object?> get props => [
    idPanitiaPesertaL,
    idLaporan,
    jenisMahasiswa,
    nim,
    namaLengkap,
    prodi,
    peran,
  ];
}
