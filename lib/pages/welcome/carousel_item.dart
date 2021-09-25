import 'package:flutter/material.dart';
import 'package:seller/widgets/home_wrapper.dart';


class CarouselItem extends StatelessWidget {
  final String imageSrc;
  final String textCode;
  CarouselItem({Key? key, required this.imageSrc, required this.textCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: homeInherited.ui.maxWidth * 0.7,
            height: homeInherited.ui.maxWidth * 0.7,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageSrc), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(100),
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(100),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            child: textCode == "userAgreementDesc"
                ? Column(
                    children: [
                      Text(
                        homeInherited.languages.getText(textCode),
                        style: homeInherited.ui.normalTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          // showInfoDialog(
                          //   context,
                          //   getFromDictionary("userAgreement"),
                          //   getFromDictionary("userAgreementFullText"),
                          //   getFromDictionary("ok"),
                          // );
                        },
                        child: Text(
                          homeInherited.languages.getText("here"),
                          style: homeInherited.ui.highlightTextStyle,
                        ),
                      ),
                    ],
                  )
                : Text(
                    homeInherited.languages.getText(textCode),
                    style: homeInherited.ui.normalTextStyle,
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }
}
