import 'package:flutter/material.dart';
import 'package:seller/models/product.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'central_appbar.dart';
import 'central_c.dart';
import 'central_drawer.dart';
import 'central_product_card.dart';

class CentralInherited extends InheritedWidget {
  final CentralController centralController;
  final Widget child;

  CentralInherited(
      {Key? key, required this.centralController, required this.child})
      : super(key: key, child: child);

  static CentralInherited? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CentralInherited>();

  @override
  bool updateShouldNotify(covariant CentralInherited oldWidget) {
    return false;
  }
}

class Central extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return CentralInherited(
      centralController: CentralController(),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: homeInherited.ui.bgColor,
          appBar: CentralAppBar(),
          body: Padding(
            padding: EdgeInsets.all(homeInherited.ui.normalPadding),
            child: ValueListenableBuilder(valueListenable: CentralInherited.of(context)!.centralController.productsSourceNotifier,
              builder: (context,List<ProductInfo> products, child) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 310,
                    crossAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return CentralProductCard(productInfo: products[index], productIndex: index,);
                },
                itemCount: products.length,
              );
            },),
          ),
          drawer: CentralDrawer(),
        ),
      ),
    );
  }
}
