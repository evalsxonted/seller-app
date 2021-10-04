import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:seller/pages/product/product_c.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class ProductImages extends StatelessWidget {
  final ProductController productController;
  const ProductImages({Key? key,required this.productController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(
                  left: ui.smallPadding, right: ui.smallPadding),
              height: ui.maxHeight * 0.7,
              width: ui.maxWidth * 0.3 - ui.normalPadding,
              child: ListView.builder(
                  itemCount: productController.productInfo.images.length,
                  itemBuilder: (BuildContext ctxt, int idx) {
                    return InkWell(
                      onTap: () {
                        productController.chosenImageNotifier.value =
                            idx;
                      },
                      child: Container(
                        width: ui.maxWidth * 0.3 - 30,
                        height:
                        ui.maxWidth * 0.3,
                        margin: EdgeInsets.only(bottom: ui.normalPadding),
                        decoration: BoxDecoration(
                          color: ui.highlightColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(70),
                            topLeft: Radius.circular(ui.normalPadding),
                            bottomLeft: Radius.circular(ui.normalPadding),
                            topRight: Radius.circular(ui.normalPadding),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  productController.productInfo.images[idx]),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                    );
                  })),
          Container(
              height: ui.maxHeight * 0.7,
              width: ui.maxWidth * 0.7,
              child: PhotoView.customChild(
                minScale: 1.0,
                maxScale: 1.0,
                backgroundDecoration:
                BoxDecoration(color: Colors.transparent),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ValueListenableBuilder(valueListenable: productController.chosenImageNotifier,
                      builder: (context,int  chosenImage, child) {
                        return Image.network(
                          productController.productInfo.images[chosenImage],
                          fit: BoxFit.fitHeight,
                        );
                      },)
                ),
              ))
        ],
      ),
    );
  }
}
