import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';
import 'package:mipoka/mipoka/presentation/widgets/custom_text_field.dart';

class CustomMipokaWebAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomMipokaWebAppBar({super.key});

  @override
  State<CustomMipokaWebAppBar> createState() => _CustomMipokaWebAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomMipokaWebAppBarState extends State<CustomMipokaWebAppBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              width: 400,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.white),
              ),
              child: TextField(
                controller: _searchController,
                maxLines: null,
                style: const TextStyle(),
                decoration: null,
              ),
            ),

            const SizedBox(width: 16),

            const Text(
              'Daniel Hamonangan Sidauruk (191112857)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1.0,
          thickness: 0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}