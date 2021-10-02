import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';

import 'categories_dropdown_w.dart';

class CentralAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).canvasColor,
      title: CategoriesDropDown(),
      actions: [
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Image.asset(
            "assets/support.png",
            width: 25,
            height: 25,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("/customerServices");
          },
        )
      ],
      centerTitle: true,
      leading: IconButton(
        onPressed: () => handleDrawer(context),
        icon: Image.asset(
          PropsHandler.singleton.getLocale.languageCode == "en" ? "assets/menu.png" : "assets/menu_rotate.png",
          width: 25,
          height: 25,
        ),
      ),
    );
  }


  @override
  Size get preferredSize {
    return new Size.fromHeight(kToolbarHeight);
  }
  handleDrawer(BuildContext context) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.of(context).pop();
    } else {
      Scaffold.of(context).openDrawer();
    }
  }
}

