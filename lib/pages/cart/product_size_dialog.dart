
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/dialogButton.dart';
import 'package:seller/widgets/home_wrapper.dart';

class SizePick extends StatefulWidget {
  final List sizes;
  final Function sizesChangeFunction;
  const SizePick({Key? key,required this.sizes,required this.sizesChangeFunction}) : super(key: key);

  @override
  _SizePickState createState() => _SizePickState();
}

class _SizePickState extends State<SizePick> {
  late List<bool> chosenSizes;
  @override
  void initState() {
    chosenSizes = List.generate(widget.sizes.length, (index) => false);
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
        title: Text(languages.getText("chooseSize"), style: ui.titleTextStyle,),
        content: Container(
          height: ui.maxHeight * 0.5,
          width: ui.maxWidth * 0.5,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 0.2,
                childAspectRatio: 1,
                mainAxisSpacing: 0.2,
                maxCrossAxisExtent: 100,
                mainAxisExtent: 100
            ),
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  setState(() {
                    chosenSizes[index] = !chosenSizes[index];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: chosenSizes[index]? ui.accentButtonColor : Colors.transparent,
                    border: Border.all(color: ui.accentButtonColor, width: ui.smallPadding) ,
                  ),
                  margin: EdgeInsets.all(ui.normalPadding),
                  padding: EdgeInsets.all(ui.normalPadding),
                  child: Center(child: Text(widget.sizes[index],
                    style: TextStyle(color: chosenSizes[index]? ui.hintColor : ui.highlightColor),)),
                ),
              );
            },),
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
                  child: DialogButton(buttonText: languages.getText("cancel"), buttonFunction: () {
                    Navigator.of(context).pop();
                  },
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
    List<String> tempChosenSizes = [];
    for (int i=0; i< chosenSizes.length; i++){
      if(chosenSizes[i]){
        tempChosenSizes.add(widget.sizes[i]);
      }
    }
    widget.sizesChangeFunction(tempChosenSizes);
    Navigator.of(context).pop();
  }
}
