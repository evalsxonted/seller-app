import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seller/apis/message.dart';
import 'package:seller/db/hive_prefs.dart';
import 'package:seller/models/message.dart';
import 'package:image_picker/image_picker.dart';

class CustomerServiceController {
  // ignore: close_sinks
  final StreamController<MessageInfo> messagesStream =
      StreamController<MessageInfo>.broadcast();
  List<MessageInfo> messages = [];
  final ValueNotifier<bool> adminReadNotifier = ValueNotifier<bool>(false);
  final listScrollController = ScrollController();
  final messageController = TextEditingController();
  final int userPhone = HivePrefs.singleton!.getUserPhone;

  CustomerServiceController() {
    initMessages();
    messagesStream.stream.listen((MessageInfo message) {
      messages.add(message);
    });
  }

  Future<void> initMessages() async {
    MessageAPI().getMessages(userPhone).then((List<MessageInfo>? messagesList) {
      if (messagesList != null) {
        messages = messagesList;
        messagesStream.add(messagesList[0]);
      }
    });
  }

  sendImage(withImgText) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    messageController.text = "";
    MessageInfo messageInfo = MessageInfo(
      message: "uploading....",
      sender: userPhone,
      date: DateTime.now(),
      adminMessage: false,
    );
    messagesStream.add(messageInfo);
    int? messageIndex;
    if (messages.length > 1) {
      messageIndex = messages.length - 1;
      listScrollController
          .jumpTo(listScrollController.position.minScrollExtent);
    }
    MessageAPI()
        .uploadImage(File(pickedFile.path), userPhone)
        .then((String? imageUrl) {
      if (imageUrl != null) {
        messageInfo.image = imageUrl;
        messageInfo.message = withImgText;
        MessageAPI().sendMessage(messageInfo).then((bool sent) {
          if (sent) {
            if (messageIndex != null) {
              messages.removeAt(messageIndex);
            }
            messagesStream.add(messageInfo);
            listScrollController
                .jumpTo(listScrollController.position.minScrollExtent);
          }
        });
      }
    });
  }

  sendMessage(String message) async {
    if (message == "") {
      return;
    }
    messageController.text = "";
    MessageInfo messageInfo = MessageInfo(
        message: message,
        sender: userPhone,
        date: DateTime.now(),
        adminMessage: false);
    MessageAPI().sendMessage(messageInfo).then((bool sent) {
      if (sent) {
        messagesStream.add(messageInfo);
        listScrollController
            .jumpTo(listScrollController.position.minScrollExtent);
      }
    });
    if (messages.length > 1) {
      listScrollController
          .jumpTo(listScrollController.position.minScrollExtent);
    }
  }
}
