import 'package:flutter/material.dart';

class CarouselPageController{

  final ValueNotifier<int> _carouselNotifier = ValueNotifier<int>(0);
  int get currentCarouselIndex => _carouselNotifier.value;
  ValueNotifier<int> get carouselNotifier => _carouselNotifier;
  set setCarouselIndex(int index) => { _carouselNotifier.value = index };

}