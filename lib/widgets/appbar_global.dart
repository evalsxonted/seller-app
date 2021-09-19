
import 'package:flutter/material.dart';

class AppBarGlobal extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarGlobal([this.title = ""]);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).canvasColor,
      title: Text(title, style: Theme.of(context).textTheme.headline2,),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, size: 30, color: Colors.white,),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(kToolbarHeight);
  }

}
