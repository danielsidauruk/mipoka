import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/check_for_duplicated.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_icon_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_mobile_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class PenggunaMPTUnggahBuktiPage extends StatefulWidget {
  const PenggunaMPTUnggahBuktiPage({super.key});

  @override
  State<PenggunaMPTUnggahBuktiPage> createState() => _PenggunaMPTUnggahBuktiPageState();
}

class _PenggunaMPTUnggahBuktiPageState extends State<PenggunaMPTUnggahBuktiPage> {
  final TextEditingController _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaMobileAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const CustomMobileTitle(text: 'MPT - Unggah Bukti MPT'),

              const CustomFieldSpacer(),

              CustomContentBox(
                children: [

                  buildTitle('Unggah File 1'),
                  CustomFilePickerButton(
                    // text: buttonText,
                    onTap: () async {
                      await FileUploaderAndCheckDuplicated.selectAndUploadFileForChecker('file1');
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Unggah File 2'),
                  CustomFilePickerButton(
                    onTap: () async {
                      await FileUploaderAndCheckDuplicated.selectAndUploadFileForChecker('file2');
                    },
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('List File Path'),
                  CustomFilePickerButton(
                    onTap: () => print(FileUploaderAndCheckDuplicated.getStoredFiles()),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('List File Path'),
                  CustomIconButton(
                    icon: Icons.delete,
                    text: 'Clear Cache',
                    onTap: () => FileUploaderAndCheckDuplicated.clearStoredFiles(),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),
                  CustomTextField(controller: _keteranganController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Batal',
                      ),

                      const SizedBox(width: 8.0),

                      CustomMipokaButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Tambah',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getFileNameAndSize(String filePath) {
    File file = File(filePath);
    String fileName = file.path.split('/').last;
    String fileSize = '${(file.lengthSync() / 1024).toStringAsFixed(2)} KB';
    return '$fileName ($fileSize)';
  }
}
