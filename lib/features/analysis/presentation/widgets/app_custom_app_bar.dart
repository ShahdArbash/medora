import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class AppCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing;
  final bool showBack;

  const AppCustomAppBar({
    super.key,
    required this.title,
    this.trailing,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBack
          ? Padding(
              padding: const EdgeInsets.only(top: 23),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            )
          : null,

      title: Padding(
        padding: const EdgeInsets.only(top: 23),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: CairoFonts.bold(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                /// 👇 أي Widget (Badge - Icon - Text)
                if (trailing != null) ...[const SizedBox(width: 8), trailing!],
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
