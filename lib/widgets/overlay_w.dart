import 'dart:ui';

import 'package:flutter/material.dart';

import 'overlay_c.dart';

class MyOverlay extends StatelessWidget {
  final MyOverlayController overlayController;
  final Widget overlayChild;

  const MyOverlay(
      {Key? key, required this.overlayController, required this.overlayChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        overlayChild,
        ValueListenableBuilder(
          valueListenable: overlayController.overlayNotifier,
          builder: (context, bool value, child) {
            return LayoutBuilder(
              builder: (context, constraints) => Visibility(
                visible: value,
                child: AbsorbPointer(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
