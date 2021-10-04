import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/dialogButton.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';

class DetailsPick extends StatefulWidget {
  final Function detailsChangeFunction;
  const DetailsPick({Key? key,required this.detailsChangeFunction}) : super(key: key);
  @override
  _DetailsPickState createState() => _DetailsPickState();
}

class _DetailsPickState extends State<DetailsPick> {
  late final TextEditingController detailsController ;
  @override
  void initState() {
    detailsController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(ui.normalPadding))),
          backgroundColor: ui.bgColor,
          title: Text(
            languages.getText("otherDetails"),
            style: ui.bigTitleTextStyle,
          ),
          content: CustomInput(editingController: detailsController),
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
                  SizedBox(width: ui.smallPadding,),
                  Container(
                    margin: EdgeInsets.all(ui.smallPadding),
                    child: DialogButton(buttonText: languages.getText("cancel"), buttonFunction: cancel,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  confirmSelection(){
    widget.detailsChangeFunction(detailsController.text);
    Navigator.of(context).pop();
  }
  cancel(){
    Navigator.of(context).pop();
  }
}
