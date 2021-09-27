import 'package:flutter/material.dart';

class AppBarGlobal extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? backFunction;

  const AppBarGlobal({this.title = "", this.backFunction});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme
          .of(context)
          .canvasColor,
      title: Text(title, style: Theme
          .of(context)
          .textTheme
          .headline2,),
      leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: Colors.white,),
          onPressed: backFunction ?? () => goBack(context),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(kToolbarHeight);
  }

  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

}
