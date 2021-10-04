import 'package:flutter/material.dart';
import 'package:seller/models/message.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/image_view.dart';

class ImageMessage extends StatelessWidget {
  final MessageInfo message;

  const ImageMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: Hero(
              tag: message.image!,
              child: Image.network(
                message.image!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeWrapper(
                        child: MyImageView(
                      imageSrc: message.image!,
                      tag: message.image!,
                    ))));
          },
        ),
        Text(
          message.message,
          style: HomeInherited.of(context)!.ui.normalTextStyle,
        )
      ],
    );
  }
}
