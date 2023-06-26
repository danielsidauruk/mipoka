import 'package:equatable/equatable.dart';

class Session extends Equatable{
  final int idSession;
  final String idUser;
  final int idOrmawa;
  final String tanggalMulai;
  final String tanggalSelesai;
  final String ruangan;
  final String gedung;
  final String waktuMulaiPenggunaan;
  final String waktuSelesaiPenggunaan;
  final String kegiatan;
  final int proyektor;
  final int laptop;
  final int mikrofon;
  final int speaker;
  final int meja;
  final int kursi;
  final int papanTulis;
  final int spidol;
  final String lainLain;
  final String status;
  final String keterangan;
  final String updatedAt;
  final String createdAt;
  final String updatedBy;
  final String createdBy;

  const Session({
    required this.idSession,
    required this.idUser,
    required this.idOrmawa,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.ruangan,
    required this.gedung,
    required this.waktuMulaiPenggunaan,
    required this.waktuSelesaiPenggunaan,
    required this.kegiatan,
    required this.proyektor,
    required this.laptop,
    required this.mikrofon,
    required this.speaker,
    required this.meja,
    required this.kursi,
    required this.papanTulis,
    required this.spidol,
    required this.lainLain,
    required this.status,
    required this.keterangan,
    required this.updatedAt,
    required this.createdAt,
    required this.updatedBy,
    required this.createdBy,
  });

  Session copyWith({
    int? idSession,
    String? idUser,
    int? idOrmawa,
    String? tanggalMulai,
    String? tanggalSelesai,
    String? ruangan,
    String? gedung,
    String? waktuMulaiPenggunaan,
    String? waktuSelesaiPenggunaan,
    String? kegiatan,
    int? proyektor,
    int? laptop,
    int? mikrofon,
    int? speaker,
    int? meja,
    int? kursi,
    int? papanTulis,
    int? spidol,
    String? lainLain,
    String? status,
    String? keterangan,
    String? updatedAt,
    String? createdAt,
    String? updatedBy,
    String? createdBy,
  }) =>
      Session(
        idSession: idSession ?? this.idSession,
        idUser: idUser ?? this.idUser,
        idOrmawa: idOrmawa ?? this.idOrmawa,
        tanggalMulai: tanggalMulai ?? this.tanggalMulai,
        tanggalSelesai: tanggalSelesai ?? this.tanggalSelesai,
        ruangan: ruangan ?? this.ruangan,
        gedung: gedung ?? this.gedung,
        waktuMulaiPenggunaan: waktuMulaiPenggunaan ?? this.waktuMulaiPenggunaan,
        waktuSelesaiPenggunaan: waktuSelesaiPenggunaan ?? this.waktuSelesaiPenggunaan,
        kegiatan: kegiatan ?? this.kegiatan,
        proyektor: proyektor ?? this.proyektor,
        laptop: laptop ?? this.laptop,
        mikrofon: mikrofon ?? this.mikrofon,
        speaker: speaker ?? this.speaker,
        meja: meja ?? this.meja,
        kursi: kursi ?? this.kursi,
        papanTulis: papanTulis ?? this.papanTulis,
        spidol: spidol ?? this.spidol,
        lainLain: lainLain ?? this.lainLain,
        status: status ?? this.status,
        keterangan: keterangan ?? this.keterangan,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
      );

  @override
  List<Object?> get props => [
    idSession,
    idUser,
    idOrmawa,
    tanggalMulai,
    tanggalSelesai,
    ruangan,
    gedung,
    waktuMulaiPenggunaan,
    waktuSelesaiPenggunaan,
    kegiatan,
    proyektor,
    laptop,
    mikrofon,
    speaker,
    meja,
    kursi,
    papanTulis,
    spidol,
    lainLain,
    status,
    keterangan,
    updatedAt,
    createdAt,
    updatedBy,
    createdBy,
  ];
}
