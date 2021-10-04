import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

import 'appbar_global.dart';

class MyImageView extends StatelessWidget {
  final imageSrc;
  final tag;
  const MyImageView({Key? key, this.imageSrc, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ui.bgColor,
        appBar: AppBarGlobal(
          title: "",
        ),
        body: PhotoView.customChild(
          minScale: 1.0,
          maxScale: 1.0,
          backgroundDecoration:
          BoxDecoration(color: ui.bgColor),
          heroAttributes: PhotoViewHeroAttributes(tag: tag),
          child: Image.network(
            imageSrc,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
