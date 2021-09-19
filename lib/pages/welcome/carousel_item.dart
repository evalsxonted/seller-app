import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/utilities/langauges.dart';


class CarouselItem extends StatelessWidget {
  final String imageSrc;
  final String textCode;
  CarouselItem({Key? key, required this.imageSrc, required this.textCode}) : super(key: key);
  final Languages _languages = Languages(PropsHandler.singleton.getLocale);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
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
                        _languages.getText(textCode),
                        style: Theme.of(context).textTheme.bodyText1,
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
                          _languages.getText("here"),
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                    ],
                  )
                : Text(
                    _languages.getText(textCode),
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }
}
