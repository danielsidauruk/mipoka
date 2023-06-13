import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/presentation/bloc/cubit/signature_cubit.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class CustomSignaturePad extends StatelessWidget {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey =
  GlobalKey<SfSignaturePadState>();

  CustomSignaturePad({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignatureCubit>(
      create: (context) => SignatureCubit(),
      child: BlocBuilder<SignatureCubit, SignatureState>(
        builder: (context, state) {
          return InkWell(
            onTap: () => context.read<SignatureCubit>().toggleSignature(),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                children: [
                  !state.isSignatureVisible
                      ? InkWell(
                    onTap: () {
                      context.read<SignatureCubit>().toggleSignature();
                    },
                    child: const Text(
                      'Tekan untuk tanda tangan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                      : const Center(),
                  state.isSignatureVisible
                      ? Column(
                    children: [
                      const CustomFieldSpacer(height: 4.0),
                      SfSignaturePad(
                        key: signatureGlobalKey,
                        backgroundColor: Colors.white,
                        strokeColor: Colors.black,
                        minimumStrokeWidth: 1.0,
                        maximumStrokeWidth: 4.0,
                      ),
                      const CustomFieldSpacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<SignatureCubit>().toggleSignature();
                            },
                            child: const Text(
                              'Tutup',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              signatureGlobalKey.currentState?.clear();
                            },
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ) :
                  const Center(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

