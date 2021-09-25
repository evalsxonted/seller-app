import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';

class HomeInherited extends InheritedWidget{
  final Widget child;
  final HelperUI ui;
  final Languages languages;
  HomeInherited( {Key? key, required this.child, required this.ui ,required this.languages,})
      : super(key: key, child: child);


  static HomeInherited? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeInherited>();

  @override
  bool updateShouldNotify(covariant HomeInherited oldWidget) {
    return !identical(oldWidget.ui, ui) || !identical(oldWidget.languages, languages);
  }
}
class HomeWrapper extends StatelessWidget {
  final Widget child;
  const HomeWrapper({Key? key,required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HomeInherited(child: Directionality(
      textDirection: PropsHandler.singleton.getTextDirection,
        child: child), ui: HelperUI(context), languages: Languages(PropsHandler.singleton.getLocale));
  }
}
