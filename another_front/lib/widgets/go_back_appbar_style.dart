import 'package:another/constant/const/color.dart';
import 'package:flutter/material.dart';


class GoBackAppBarStyle extends StatelessWidget implements PreferredSizeWidget {
  bool? toHome;
  String? runningId;
  String? title;
  GoBackAppBarStyle({
    this.toHome,
    this.runningId,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BACKGROUND_COLOR,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (toHome == true) {
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          }
          Navigator.of(context).pop(runningId ?? '');
        },
        icon: Icon(
          Icons.navigate_before,
          size: 40.0,
        ),
      ),
      title: Text(title ?? ''),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
