import 'package:flutter/material.dart';
import 'package:seller/widgets/home_wrapper.dart';

import 'welcome_w.dart';

class CarouselIndicator extends StatelessWidget {

  CarouselIndicator({Key? key, required this.count}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 108,
        child: ValueListenableBuilder(
          valueListenable: WelcomeInherit.of(context)!.carouselController.carouselNotifier,
          builder: (_, currentIndex, ___) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? HomeInherited.of(context)!.ui.highlightColor
                        : HomeInherited.of(context)!.ui.primaryButtonColor,
                  ),
                );
              },
            );
          },
        ));
  }
}
