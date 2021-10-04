import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:seller/apis/product.dart';
import 'package:seller/db/hive_prefs.dart';
import 'package:seller/models/product.dart';
import 'package:seller/pages/central/central_w.dart';
import 'package:seller/pages/product/product_w.dart';
import 'package:seller/widgets/home_wrapper.dart';

class CentralProductCard extends StatelessWidget {
  final ProductInfo productInfo;
  final int productIndex;
  const CentralProductCard({Key? key,required this.productInfo, required this.productIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return InkWell(
      onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeWrapper(child: Product( productInfo: productInfo,)),));
      },
      child: Container(
        decoration: BoxDecoration(
          color: homeInherited.ui.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(homeInherited.ui.smallPadding)),
        ),
        padding: EdgeInsets.only(top: homeInherited.ui.smallPadding),
        child: Column(
          children: <Widget>[
            Center(
                child: Text(
                  productInfo.title,
                  style: homeInherited.ui.normalTextStyle,
                )),
            SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(homeInherited.ui.smallPadding),
              child: Image.network(
                productInfo.images[0],
                width: 160,
                height: 200,
                fit: BoxFit.fitWidth,
                key: Key(productInfo.id),
              ),
            ),
            SizedBox(
              height: homeInherited.ui.smallPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: homeInherited.ui.smallPadding),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:  homeInherited.ui.smallPadding, top:  homeInherited.ui.smallPadding),
                            child: Text(
                              productInfo.price.toString() + " IQD",
                              style: homeInherited.ui.smallTextStyle),
                            ),
                          productInfo.oldPrice != null
                              ? Padding(
                                  padding:  EdgeInsets.only(left: homeInherited.ui.normalPadding),
                                  child: Text(productInfo.oldPrice.toString() + " IQD",
                                      style: homeInherited.ui.discountedTextStyle))
                              : SizedBox(),
                        ],
                      )),
                ),
                LikeButton(
                  isLiked: productInfo.liked,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: homeInherited.ui.primaryButtonColor,
                      size: 30,
                    );
                  },
                  padding: EdgeInsets.only(right: homeInherited.ui.smallPadding),
                  onTap: (isLiked) async {
                    ProductAPI().likeProduct(HivePrefs.singleton?.getUserPhone ?? -1, productInfo.id, !isLiked);
                    productInfo.liked = !isLiked;
                    CentralInherited.of(context)!.centralController.productsSourceNotifier.value.replaceRange(productIndex,
                        productIndex+1, [productInfo]);
                    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                    CentralInherited.of(context)!.centralController.productsSourceNotifier.notifyListeners();
                    return !isLiked;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

