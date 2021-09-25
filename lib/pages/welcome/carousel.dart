import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'carousel_indicator.dart';
import 'carousel_item.dart';
import 'welcome_w.dart';

final List<String> _images = [
  "assets/welcome.png",
  "assets/shopping.png",
  "assets/location.png",
  "assets/messaging.png",
  "assets/agreement.png",
  "assets/start.png",
];
final List<String> _texts = [
  "welcomeUser",
  "shoppingWelcome",
  "toYourLocation",
  "messagingAvailable",
  "userAgreementDesc",
  "letsStart",
];

class CarouselWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            initialPage: 0,
            height: homeInherited.ui.maxHeight,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(seconds: 2),
            enableInfiniteScroll: false,
            pauseAutoPlayInFiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, _) {
              WelcomeInherit.of(context)?.carouselController.setCarouselIndex = index;
            },
          ),
          items: List.generate(
              _images.length,
                  (index) => CarouselItem(
                  imageSrc: _images[index], textCode: _texts[index])),
        ),
        Positioned(
          bottom: 1,
          left: homeInherited.ui.maxWidth * 0.5 - 80,
          child: CarouselIndicator(
            count: _images.length,
          ),
        )
      ],
    );
  }
}
