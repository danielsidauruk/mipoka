import 'package:flutter/material.dart';

class MipokaMobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onRefresh;

  const MipokaMobileAppBar({
    this.onRefresh,
    super.key,
  });

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
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1.0,
          thickness: 0.5,
          color: Colors.white,
        ),
      ),
      actions: [
        if (onRefresh != null)
          InkWell(
            onTap: onRefresh,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}