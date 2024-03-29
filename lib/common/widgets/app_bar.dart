import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final ShapeBorder? shape;

  const AppBarWidget({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: shape,
      leading: leading,
      title: Text(
        title ?? "",
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: actions,
      elevation: 0.4,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
