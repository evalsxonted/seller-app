import 'package:flutter/material.dart';
import 'package:seller/pages/central/categories_dropdown_c.dart';

class CategoriesDropDown extends StatefulWidget {

  CategoriesDropDown();

  @override
  _CategoriesDropDownState createState() => _CategoriesDropDownState();
}

class _CategoriesDropDownState extends State<CategoriesDropDown>
    with SingleTickerProviderStateMixin {
  late final CategoriesDropDownController _controller ;

  @override
  void initState() {
    _controller = CategoriesDropDownController(this, context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.initInherited();
    return Container(
      padding: EdgeInsets.only(
          right: _controller.homeInherited!.ui.largePadding,
          left: _controller.homeInherited!.ui.largePadding,
          top: _controller.homeInherited!.ui.normalPadding,
          bottom: _controller.homeInherited!.ui.smallPadding),
      key: _controller.buttonKey,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ValueListenableBuilder(valueListenable: _controller.dropdownOpen, builder: (context,bool isMenuOpen, _) {
        return InkWell(
          onTap: () {
            if (isMenuOpen) {
              _controller.closeMenu();
            } else {
              _controller.openMenu();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _controller.homeInherited!.languages.getText("categories"),
                style: _controller.homeInherited!.ui.titleTextStyle,
              ),
              SizedBox(
                width: _controller.homeInherited!.ui.smallPadding,
              ),
              Icon(
                isMenuOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: _controller.homeInherited!.ui.iconColor,
                size: 35,
              ),
            ],
          ),
        );
      },)
    );
  }

}
