import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mipoka/domain/utils/dio_util.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
import 'package:mipoka/mipoka/data/repositories/mipoka_repositories_impl.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';
import 'package:mipoka/mipoka/domain/use_cases/Periode_mpt_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/admin_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/berita_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/biaya_kegiatan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/jenis_kegiatan_mpt_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/kegiatan_per_periode_mpt_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/laporan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/mhs_per_periode_mpt_use_cases.dart';
import 'package:mipoka/mipoka/domain/use_cases/nama_kegiatan_mpt.dart';
import 'package:mipoka/mipoka/domain/use_cases/notifikasi_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/ormawa_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/partisipan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/peserta_kegiatan_laporan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/prestasi_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/revisi_laporan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/revisi_usulan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/rincian_biaya_kegiatan_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/riwayat_kegiatan_mpt_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/session_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/tertib_acara_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/mipoka_user_use_case.dart';
import 'package:mipoka/mipoka/domain/use_cases/usulan_kegiatan_use_case.dart';
import 'package:mipoka/mipoka/presentation/bloc/admin_bloc/admin_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/biaya_kegiatan_bloc/biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_drop_down_bloc/jenis_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/jenis_kegiatan_mpt/jenis_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/kegiatan_per_periode_mpt_bloc/kegiatan_per_periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/laporan_bloc/laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mhs_per_periode_mpt_use_cases/mhs_per_periode_mpt_use_cases_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_by_nim_bloc/mipoka_user_by_nim_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegaitan_mpt_bloc/nama_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/nama_kegiatan_drop_down_bloc/nama_kegiatan_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/notifikasi_bloc/notifikasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/ormawa_bloc/ormawa_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/partisipan_bloc/partisipan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_bloc/periode_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/periode_mpt_dropdown_bloc/periode_mpt_drop_down_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/peserta_kegiatan_laporan_bloc/peserta_kegiatan_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/prestasi_bloc/prestasi_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_laporan_bloc/revisi_laporan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/revisi_usulan_bloc/revisi_usulan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/rincian_biaya_kegiatan_bloc/rincian_biaya_kegiatan_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/riwayat_kegiatan_mpt_bloc/riwayat_kegiatan_mpt_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/session/session_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/tertib_acara/tertib_acara_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/usulan_kegiatan_bloc/usulan_kegiatan_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // EXTERNAL
  locator.registerLazySingleton<Client>(() => Client());
  locator.registerLazySingleton<Dio>(() => DioUtil.dio);

  // BLOC
  locator.registerFactory(() => AdminBloc(adminUseCase: locator()));
  locator.registerFactory(() => BeritaBloc(beritaUseCase: locator()));
  locator.registerFactory(() => BiayaKegiatanBloc(biayaKegiatanUseCase: locator()));
  locator.registerFactory(() => JenisKegiatanMptBloc(jenisKegiatanMptUseCase: locator()));
  locator.registerFactory(() => KegiatanPerPeriodeMptBloc(kegiatanPerPeriodeMptUseCase: locator()));
  locator.registerFactory(() => LaporanBloc(laporanUseCase: locator()));
  locator.registerFactory(() => MhsPerPeriodeMptBloc(mhsPerPeriodeMptUseCase: locator()));
  locator.registerFactory(() => OrmawaBloc(ormawaUseCase: locator()));
  locator.registerFactory(() => PartisipanBloc(partisipanUseCase: locator()));
  locator.registerFactory(() => PeriodeMptBloc(periodeMptUseCase: locator()));
  locator.registerFactory(() => PesertaKegiatanLaporanBloc(pesertaKegiatanLaporanUseCase: locator()));
  locator.registerFactory(() => PrestasiBloc(prestasiUseCase: locator()));
  locator.registerFactory(() => RevisiLaporanBloc(revisiLaporanUseCase: locator()));
  locator.registerFactory(() => RevisiUsulanBloc(revisiUsulanUseCase: locator()));
  locator.registerFactory(() => RincianBiayaKegiatanBloc(rincianBiayaKegiatanUseCase: locator()));
  locator.registerFactory(() => RiwayatKegiatanMptBloc(riwayatKegiatanMptUseCase: locator()));
  locator.registerFactory(() => SessionBloc(sessionUseCase: locator()));
  locator.registerFactory(() => TertibAcaraBloc(tertibAcaraUseCase: locator()));
  locator.registerFactory(() => MipokaUserBloc(mipokaUserUseCase: locator()));
  locator.registerFactory(() => MipokaUserByNimBloc(mipokaUserUseCase: locator()));
  locator.registerFactory(() => UsulanKegiatanBloc(usulanKegiatanUseCase: locator()));
  locator.registerFactory(() => NamaKegiatanMptBloc(namaKegiatanMptUseCase: locator()));
  locator.registerFactory(() => NotifikasiBloc(notifikasiUseCase: locator()));
  locator.registerFactory(() => PeriodeMptDropDownBloc(periodeMptUseCase: locator()));
  locator.registerFactory(() => NamaKegiatanDropDownBloc(namaKegiatanMptUseCase: locator()));
  locator.registerFactory(() => JenisKegiatanDropDownBloc(jenisKegiatanMptUseCase: locator()));

  // USE CASE
  locator.registerLazySingleton(() => AdminUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => BeritaUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => BiayaKegiatanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => KegiatanPerPeriodeMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => JenisKegiatanMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => MipokaUserUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => LaporanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => OrmawaUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PartisipanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PeriodeMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PesertaKegiatanLaporanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => PrestasiUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RevisiLaporanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RevisiUsulanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RincianBiayaKegiatanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => RiwayatKegiatanMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => SessionUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => TertibAcaraUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => UsulanKegiatanUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => MhsPerPeriodeMptUseCases(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => NamaKegiatanMptUseCase(mipokaRepositories: locator()));
  locator.registerLazySingleton(() => NotifikasiUseCase(mipokaRepositories: locator()));

  // REPOSITORIES
  locator.registerLazySingleton<MipokaRepositories>(() =>
      MipokaRepositoriesImpl(mipokaDataSources: locator()),
  );

  // DATA SOURCES
  locator.registerLazySingleton<MipokaDataSources>(() =>
      MipokaDataSourcesImpl(client: locator()),
  );
}