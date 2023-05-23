import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/domain/utils/check_for_duplicated.dart';
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

                  buildTitle('Keterangan'),
                  CustomTextField(controller: _keteranganController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: 'Batal',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
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
}
