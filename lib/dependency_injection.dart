import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
import 'package:mipoka/mipoka/data/repositories/mipoka_repositories_impl.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';
import 'package:mipoka/mipoka/domain/use_cases/Periode_mpt_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/admin_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/berita_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/biaya_kegiatan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/kegiatan_mpt_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/laporan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/ormawa_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/partisipan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/peserta_kegiatan_laporan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/prestasi_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/revisi_laporan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/revisi_usulan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/rincian_biaya_kegiatan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/riwayat_mpt_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/session_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/tertib_acara_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/mipoka_user_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/usulan_kegiatan_use_case.dart';
import 'package:mipoka/mipoka/presentation/bloc/admin_bloc/admin_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/biaya_kegiatan_bloc/biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_mpt_bloc/kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/partisipan_bloc/partisipan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/peserta_kegiatan_laporan_bloc/peserta_kegiatan_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_laporan_bloc/revisi_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/rincian_biaya_kegiatan_bloc/rincian_biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_mpt_bloc/riwayat_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/tertib_acara/tertib_acara_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // EXTERNAL
  locator.registerLazySingleton<Client>(() => Client());

  // BLOC
  locator.registerFactory(() => AdminBloc(adminUseCase: locator()));
  locator.registerFactory(() => BeritaBloc(beritaUseCase: locator()));
  locator.registerFactory(() => BiayaKegiatanBloc(biayaKegiatanUseCase: locator()));
  locator.registerFactory(() => KegiatanMptBloc(kegiatanMptUseCase: locator()));
  locator.registerFactory(() => LaporanBloc(laporanUseCase: locator()));
  locator.registerFactory(() => OrmawaBloc(ormawaUseCase: locator()));
  locator.registerFactory(() => PartisipanBloc(partisipanUseCase: locator()));
  locator.registerFactory(() => PeriodeMptBloc(periodeMptUseCase: locator()));
  locator.registerFactory(() => PesertaKegiatanLaporanBloc(pesertaKegiatanLaporanUseCase: locator()));
  locator.registerFactory(() => PrestasiBloc(prestasiUseCase: locator()));
  locator.registerFactory(() => RevisiLaporanBloc(revisiLaporanUseCase: locator()));
  locator.registerFactory(() => RevisiUsulanBloc(revisiUsulanUseCase: locator()));
  locator.registerFactory(() => RincianBiayaKegiatanBloc(rincianBiayaKegiatanUseCase: locator()));
  locator.registerFactory(() => RiwayatMptBloc(riwayatMptUseCase: locator()));
  locator.registerFactory(() => SessionBloc(sessionUseCase: locator()));
  locator.registerFactory(() => TertibAcaraBloc(tertibAcaraUseCase: locator()));
  locator.registerFactory(() => MipokaUserBloc(mipokaUserUseCase: locator()));
  locator.registerFactory(() => UsulanKegiatanBloc(usulanKegiatanUseCase: locator()));

  // USE CASE
  locator.registerLazySingleton(() => AdminUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => BeritaUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => BiayaKegiatanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => KegiatanMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => LaporanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => MipokaUserUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => OrmawaUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PartisipanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PeriodeMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PesertaKegiatanLaporanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PrestasiUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RevisiLaporanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RevisiUsulanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RincianBiayaKegiatanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RiwayatMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => SessionUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => TertibAcaraUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => UsulanKegiatanUseCase(mipokaRepositories: locator()));


  // REPOSITORIES
  locator.registerLazySingleton<MipokaRepositories>(() =>
      MipokaRepositoriesImpl(mipokaDataSources: locator()),
  );

  // DATA SOURCES
  locator.registerLazySingleton<MipokaDataSources>(() =>
      MipokaDataSourcesImpl(client: locator()),
  );
}