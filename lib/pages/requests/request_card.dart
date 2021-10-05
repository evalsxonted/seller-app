import 'package:flutter/material.dart';
import 'package:seller/models/request.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class RequestCard extends StatelessWidget {
  final RequestInfo requestInfo;
  final List images;

  RequestCard({Key? key, required this.requestInfo})
      : images = List.generate(requestInfo.selectedProducts.length,
            (index) => requestInfo.selectedProducts[index].images[0]),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;

    return Container(
      margin: EdgeInsets.all(ui.normalPadding),
      padding: EdgeInsets.all(ui.normalPadding),
      decoration: BoxDecoration(
        color: ui.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(ui.normalPadding)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: ui.maxWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: EdgeInsets.all(ui.normalPadding),
                  child: Image(
                    image: NetworkImage(images[index]),
                  ),
                );
              },
            ),
          ),
          SelectableText(
              languages.getText("orderId") + ": " + requestInfo.id.toString(),
              style: ui.normalTextStyle),
          Text(
              languages.getText("productsPrice") +
                  ": " +
                  requestInfo.productsPrice.toString(),
              style: ui.normalTextStyle),
          Text(
              languages.getText("deliveryPrice") +
                  ": " +
                  requestInfo.deliveryPrice.toString(),
              style: ui.normalTextStyle),
          requestInfo.location != null
              ? Text(
                  languages.getText("location") + ": " + requestInfo.location!,
                  style: ui.normalTextStyle)
              : SizedBox(),
        ],
      ),
    );
  }
}
