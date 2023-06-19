import 'package:mipoka/mipoka/data/models/user_model.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';

// => Just Updated
class SessionModel extends Session {
  final UserModel userModel;
  const SessionModel({
    required super.idSession,
    required super.userId,
    required super.ruangan,
    required super.gedung,
    required super.idOrmawa,
    required super.startTime,
    required super.endTime,
    required super.date,
    required super.kegiatan,
    required super.perlengkapan,
    required super.lain,
    required super.status,
    required super.keterangan,
    required super.updatedAt,
    required super.createdAt,
    required super.updatedBy,
    required this.userModel,
  }) : super(user: userModel);

  factory SessionModel.fromEntity(Session session) {
    return SessionModel(
      idSession: session.idSession,
      userId: session.userId,
      ruangan: session.ruangan,
      gedung: session.gedung,
      idOrmawa: session.idOrmawa,
      startTime: session.startTime,
      endTime: session.endTime,
      date: session.date,
      kegiatan: session.kegiatan,
      perlengkapan: session.perlengkapan,
      lain: session.lain,
      status: session.status,
      keterangan: session.keterangan,
      updatedAt: session.updatedAt,
      createdAt: session.createdAt,
      updatedBy: session.updatedBy,
      userModel: UserModel.fromEntity(session.user),
    );
  }

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    idSession: json["idSession"],
    userId: json["userId"],
    ruangan: json["ruangan"],
    gedung: json["gedung"],
    idOrmawa: json["idOrmawa"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    date: DateTime.parse(json["date"]),
    kegiatan: json["kegiatan"],
    perlengkapan: json["perlengkapan"],
    lain: json["lain"],
    status: json["status"],
    keterangan: json["keterangan"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedBy: json["updatedBy"],
    userModel: UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "idSession": idSession,
    "userId": userId,
    "ruangan": ruangan,
    "gedung": gedung,
    "idOrmawa": idOrmawa,
    "startTime": startTime,
    "endTime": endTime,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "kegiatan": kegiatan,
    "perlengkapan": perlengkapan,
    "lain": lain,
    "status": status,
    "keterangan": keterangan,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedBy": updatedBy,
    "user": userModel.toJson(),
  };
}
