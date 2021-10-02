

import 'package:flutter/material.dart';
import 'package:seller/apis/product.dart';
import 'package:seller/pages/central/central_w.dart';
import 'package:seller/widgets/home_wrapper.dart';

import 'categories_dropdown_overlay.dart';

class CategoriesDropDownController{
  late List<Widget> dropDownWidgets;
  GlobalKey buttonKey = LabeledGlobalKey("button_icon");
  late OverlayEntry overlayEntry;
  late AnimationController animationController;
  CentralInherited? centralInherited;
  HomeInherited? homeInherited;
  int chosenCategory  = -1;
  ValueNotifier<bool> dropdownOpen = ValueNotifier(false);
  late final BuildContext context;
  CategoriesDropDownController(TickerProvider tickerProvider,this.context){
    dropDownWidgets = [];
    animationController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 250),
    );
  }
  initInherited(){
    if(centralInherited == null){
      centralInherited = CentralInherited.of(context)!;
      homeInherited = HomeInherited.of(context)!;
    }
  }
  setCategoriesWidgets() {
    if (centralInherited!.centralController.categories != null) {
        dropDownWidgets = List.generate(
            centralInherited!.centralController.categories!.length,
                (index) => Text(
              centralInherited!.centralController.categories![index]
                  .name,
              style: homeInherited!.ui.normalTextStyle,
            ));
        chosenCategory =  -1;
    }
  }

  setSubCategoriesWidgets(int categoryIndex) {
    if (centralInherited!.centralController.categories != null) {

      List<String> subs = centralInherited!.centralController
          .categories![categoryIndex].subCategories;
        dropDownWidgets = List.generate(
            subs.length,
                (index) => Text(
                  subs[index],
              style: homeInherited!.ui.normalTextStyle,
            ));
    }
  }


  closeMenu() {
    overlayEntry.remove();
    animationController.reverse();
    dropdownOpen.value = false;
  }

  openMenu() {
    if(chosenCategory == -1){
      setCategoriesWidgets();
    }
    DropdownOverlay dropdownOverlay = DropdownOverlay(this);
    dropdownOverlay.findButton();
    animationController.forward();
    overlayEntry = dropdownOverlay.overlayEntry();
    Overlay.of(context)!.insert(overlayEntry);
    dropdownOpen.value = true;
  }

  updateToChosenCategoryAndSubCategory(categoryIndex, subIndex) async {
    chosenCategory = -1;
    centralInherited?.centralController.productsSourceNotifier
        .value = await ProductAPI().getProducts(
            centralInherited?.centralController.categories?[categoryIndex].name ?? "",
            centralInherited?.centralController.categories?[categoryIndex]
                .subCategories[subIndex]?? "") ??
        [];

  }
}