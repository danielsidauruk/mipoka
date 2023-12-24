import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/core/constanst.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/bloc/mipoka_user_bloc/mipoka_user_bloc.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/mipoka_custom_toast.dart';

class MipokaAdminDashboard extends StatefulWidget {
  const MipokaAdminDashboard({super.key});

  @override
  State<MipokaAdminDashboard> createState() => _MipokaAdminDashboardState();
}

class _MipokaAdminDashboardState extends State<MipokaAdminDashboard> {

  @override
  void initState() {
    context.read<MipokaUserBloc>().add(ReadAllMipokaUserEvent());
    super.initState();
  }

  @override
  void dispose() {
    context.read<MipokaUserBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text(
              'MIPOKA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          leading: InkWell(
            onTap: () => context.read<MipokaUserBloc>().add(ReadAllMipokaUserEvent()),
            child: const Icon(Icons.refresh),
          ),

          actions: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  mipokaCustomToast("Anda telah log out");
                  Navigator.pushNamed(context, loginPageRoute);
                  logoutUser();
                },
                child: const Icon(Icons.exit_to_app),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomMobileTitle(
                  text: 'Mipoka Admin Dashboard'),

              const CustomFieldSpacer(),

              Expanded(
                child: CustomContentBox(
                  children: [

                    Container(
                      margin: const EdgeInsets.all(4.0),
                      child: buildTitle('Akun Terdaftar'),
                    ),

                    BlocConsumer<MipokaUserBloc, MipokaUserState>(
                      listenWhen: (prev, current) =>
                      prev.runtimeType != current.runtimeType,
                      listener: (context, state) {
                        if (state is MipokaUserSuccess) {
                          context.read<MipokaUserBloc>().add(ReadAllMipokaUserEvent());
                        }
                      },

                      builder: (context, state) {
                        if (state is MipokaUserLoading) {
                          return const Text("Loading ...");
                        } else if (state is AllMipokaUserHasData) {
                          final mipokaUserList = state.mipokaUserList;

                          return Expanded(
                            child: ListView.builder(
                              itemCount: mipokaUserList.length,
                              itemBuilder: (context, index) {
                                final mipokaUser = mipokaUserList[index];

                                return Container(
                                  margin: const EdgeInsets.all(4.0),
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            buildTitle(mipokaUser.namaLengkap),
                                            Text(mipokaUser.email),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(width: 8.0),

                                      SizedBox(
                                        width: 120,
                                        child: DropdownButton<String>(
                                          value: mipokaUser.role,
                                          icon: const Icon(Icons.arrow_drop_down),
                                          isExpanded: true,
                                          underline: const Center(),
                                          onChanged: (value) {
                                            context.read<MipokaUserBloc>().add(
                                              UpdateMipokaUserEvent(
                                                mipokaUser: mipokaUser.copyWith(role: value)),
                                            );
                                          },
                                          items: roleList.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );

                        } else if (state is MipokaUserError) {
                          mipokaCustomToast(state.message);

                          return const Text("-");
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
