import 'package:flutter/material.dart';
import 'package:shopy/components/filter/filter.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  showMyBottomSheet(context);
                },
                icon: Icon(Icons.filter_list_rounded));
          }),
        )
      ],
    );
  }
}
