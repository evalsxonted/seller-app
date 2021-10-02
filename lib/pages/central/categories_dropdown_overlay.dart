import 'package:flutter/material.dart';

import 'categories_dropdown_c.dart';

class DropdownOverlay{
  late Offset _buttonPosition;
  late Size _buttonSize;
  CategoriesDropDownController categoriesDropDownController;
  DropdownOverlay(this.categoriesDropDownController);
  OverlayEntry overlayEntry() => OverlayEntry(
    builder: (context) {
      return Positioned(
        top: _buttonPosition.dy + _buttonSize.height,
        left: _buttonPosition.dx,
        width: _buttonSize.width,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: ClipPath(
                  clipper: _ArrowClipper(),
                  child: Container(
                    width: categoriesDropDownController.homeInherited!.ui.largePadding,
                    height: categoriesDropDownController.homeInherited!.ui.largePadding,
                    color: categoriesDropDownController.homeInherited!.ui.dropDownColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  height: categoriesDropDownController.dropDownWidgets.length * _buttonSize.height,
                  decoration: BoxDecoration(
                    color: categoriesDropDownController.homeInherited!.ui.dropDownColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        categoriesDropDownController.dropDownWidgets.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          if (categoriesDropDownController.chosenCategory != -1) {
                            categoriesDropDownController.closeMenu();
                            categoriesDropDownController.updateToChosenCategoryAndSubCategory(categoriesDropDownController.chosenCategory,index);
                            categoriesDropDownController.chosenCategory = -1;
                            categoriesDropDownController.openMenu();
                          } else {
                            categoriesDropDownController.closeMenu();
                            categoriesDropDownController.setSubCategoriesWidgets(index);
                            categoriesDropDownController.chosenCategory = index;
                            categoriesDropDownController.openMenu();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 10, top: 10),
                          width: _buttonSize.width,
                          height: _buttonSize.height,
                          child: categoriesDropDownController.dropDownWidgets[index],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  findButton() {
    RenderBox renderBox = categoriesDropDownController.buttonKey.currentContext!.findRenderObject() as RenderBox;
    _buttonSize = renderBox.size;
    _buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

}
class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
