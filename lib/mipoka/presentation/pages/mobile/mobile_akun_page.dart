import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/Method/open_file_picker_method.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_button.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_content_box.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_picker.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_drawer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_field_spacer.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mipoka_appbar.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_mobile_title.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class MobileAkunPage extends StatefulWidget {
  const MobileAkunPage({super.key});

  @override
  State<MobileAkunPage> createState() => _MobileAkunPageState();
}

class _MobileAkunPageState extends State<MobileAkunPage> {
  final TextEditingController _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MipokaAppBar(),

      drawer: const MobileCustomPenggunaDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CustomContentBox(
                children: [

                  const CustomMobileTitle(text: 'Akun'),

                  const CustomFieldSpacer(),

                  const CustomMobileTitle(text: 'Daniel Hamonangan Sidauruk (191112857'),

                  buildTitle('Unggah File'),
                  CustomFilePickerButton(
                    onTap: () => FileUploader.selectAndUploadFile('importMPT'),
                  ),

                  const CustomFieldSpacer(),

                  buildTitle('Keterangan'),
                  CustomTextField(controller: _keteranganController),

                  const CustomFieldSpacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        navigation: () => Navigator.pop(context),
                        text: 'Batal',
                      ),

                      const SizedBox(width: 8.0),

                      CustomButton(
                        navigation: () {
                          Navigator.pop(context);
                        },
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
