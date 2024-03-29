import 'package:mipoka/mipoka/data/models/mipoka_user_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';

class SessionModel extends Session {
  final MipokaUserModel mipokaUserModel;
  final OrmawaModel? ormawaModel;

  const SessionModel({
    required super.idSession,
    required this.mipokaUserModel,
    this.ormawaModel,
    required super.tanggalMulai,
    required super.tanggalSelesai,
    required super.ruang,
    required super.gedung,
    required super.waktuMulaiPenggunaan,
    required super.waktuSelesaiPenggunaan,
    required super.kegiatan,
    required super.proyektor,
    required super.laptop,
    required super.mikrofon,
    required super.speaker,
    required super.meja,
    required super.kursi,
    required super.papanTulis,
    required super.spidol,
    required super.lainLain,
    required super.status,
    required super.fileSession,
    required super.tandaTanganSA,
    required super.updatedAt,
    required super.createdAt,
    required super.updatedBy,
    required super.createdBy,
  }) : super(
    mipokaUser: mipokaUserModel,
    ormawa: ormawaModel,
  );

  factory SessionModel.fromEntity(Session session) {
    return SessionModel(
      idSession: session.idSession,
      mipokaUserModel: MipokaUserModel.fromEntity(session.mipokaUser),
      ormawaModel: session.ormawa != null
          ? OrmawaModel.fromEntity(session.ormawa!)
          : null,
      tanggalMulai: session.tanggalMulai,
      tanggalSelesai: session.tanggalSelesai,
      ruang: session.ruang,
      gedung: session.gedung,
      waktuMulaiPenggunaan: session.waktuMulaiPenggunaan,
      waktuSelesaiPenggunaan: session.waktuSelesaiPenggunaan,
      kegiatan: session.kegiatan,
      proyektor: session.proyektor,
      laptop: session.laptop,
      mikrofon: session.mikrofon,
      speaker: session.speaker,
      meja: session.meja,
      kursi: session.kursi,
      papanTulis: session.papanTulis,
      spidol: session.spidol,
      lainLain: session.lainLain,
      status: session.status,
      fileSession: session.fileSession,
      tandaTanganSA: session.tandaTanganSA,
      updatedAt: session.updatedAt,
      createdAt: session.createdAt,
      updatedBy: session.updatedBy,
      createdBy: session.createdBy,
    );
  }

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    idSession: json["id_session"],
    mipokaUserModel: MipokaUserModel.fromJson(json["user"]),
    ormawaModel: json['ormawa'] != null
        ? OrmawaModel.fromJson(json["ormawa"])
        : null,
    tanggalMulai: json["tanggal_mulai"],
    tanggalSelesai: json["tanggal_selesai"],
    ruang: json["ruangan"],
    gedung: json["gedung"],
    waktuMulaiPenggunaan: json["waktu_mulai_penggunaan"],
    waktuSelesaiPenggunaan: json["waktu_selesai_penggunaan"],
    kegiatan: json["kegiatan"],
    proyektor: json["proyektor"],
    laptop: json["laptop"],
    mikrofon: json["mikrofon"],
    speaker: json["speaker"],
    meja: json["meja"],
    kursi: json["kursi"],
    papanTulis: json["papan_tulis"],
    spidol: json["spidol"],
    lainLain: json["lain_lain"],
    status: json["status"],
    fileSession: json["file_session"],
    tandaTanganSA: json["tanda_tangan_sa"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
    updatedBy: json["updated_by"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_session": idSession,
    "user": mipokaUserModel.toJson(),
    "ormawa": ormawaModel?.toJson(),
    "tanggal_mulai": tanggalMulai,
    "tanggal_selesai": tanggalSelesai,
    "ruangan": ruang,
    "gedung": gedung,
    "waktu_mulai_penggunaan": waktuMulaiPenggunaan,
    "waktu_selesai_penggunaan": waktuSelesaiPenggunaan,
    "kegiatan": kegiatan,
    "proyektor": proyektor,
    "laptop": laptop,
    "mikrofon": mikrofon,
    "speaker": speaker,
    "meja": meja,
    "kursi": kursi,
    "papan_tulis": papanTulis,
    "spidol": spidol,
    "lain_lain": lainLain,
    "status": status,
    "file_session": fileSession,
    "tanda_tangan_sa": tandaTanganSA,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "updated_by": updatedBy,
    "created_by": createdBy,
  };
}
