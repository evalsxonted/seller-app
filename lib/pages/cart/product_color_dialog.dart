import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/dialogButton.dart';
import 'package:seller/widgets/home_wrapper.dart';

class ColorPick extends StatefulWidget {
  final List images;
  final Function setColorCallBack;
  const ColorPick({Key? key,required this.images,required this.setColorCallBack}) : super(key: key);

  @override
  _ColorPickState createState() => _ColorPickState();
}

class _ColorPickState extends State<ColorPick> {
  ScrollController imagesListController = ScrollController();
  late List<bool> chosenImages;

  @override
  void initState() {
    chosenImages = List.generate(widget.images.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        backgroundColor: ui.bgColor,
        title: Text(languages.getText("choosePhoto"), style: ui.titleTextStyle,),
        content: Container(
          height: ui.maxHeight * 0.5,
          width: ui.maxWidth * 0.5,
          child: Scrollbar(
            controller: imagesListController,
            isAlwaysShown: true,
            child: ListView.builder(
              controller: imagesListController,
              scrollDirection: Axis.horizontal,
              itemCount: chosenImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: ui.extraLargePadding, bottom: ui.normalPadding),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: chosenImages[index] ? Border.all(color: ui.accentButtonColor, width: ui.normalPadding) : null,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          chosenImages[index] = !chosenImages[index];
                        });
                      },
                      child: Image(
                        image: NetworkImage(
                          widget.images[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        actions: [
          Container(
            width: ui.maxWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(ui.smallPadding),
                    child: DialogButton(
                      buttonText: languages.getText("ok"),
                      buttonFunction: confirmSelection,
                    )),
                SizedBox(width: 5,),
                Container(
                  margin: EdgeInsets.all(ui.smallPadding),
                  child: DialogButton(buttonText: languages.getText("cancel"),
                    buttonFunction: cancel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  confirmSelection(){
    List<String> tempChosenColors = [];
    for (int i=0 ; i< chosenImages.length; i++){
      if(chosenImages[i]){
        tempChosenColors.add(widget.images[i]);
      }
    }
    widget.setColorCallBack(tempChosenColors);
    Navigator.of(context).pop();
  }
  cancel(){
    Navigator.of(context).pop();

  }
}