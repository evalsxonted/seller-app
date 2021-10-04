import 'dart:convert';

class MessageInfo {
  String message;
  int sender;
  DateTime date;
  bool adminMessage;
  String? image;

  MessageInfo(
      {required this.message,
      required this.sender,
      required this.date,
      required this.adminMessage,
      this.image});

  static List<MessageInfo> fromJsonList(String jsonList) {
    List messages = jsonDecode(jsonList);
    return List.generate(
      messages.length,
      (index) => fromMap(messages[index]),
    );
  }

  static List<MessageInfo> fromMapList(List<Map> messages) {
     return List.generate(
        messages.length,
            (index) => fromMap(messages[index]),
     );
  }

  static MessageInfo fromMap(Map info) {
    return MessageInfo(
        message: info["message"],
        sender: info["sender"],
        date: DateTime.parse(info["date"]),
        adminMessage: info["adminMessage"],
       image: info["image"]
    );
  }
  Map toMap() {
     return {
     "message": message,
     "sender": sender,
     "date": date,
     "adminMessage": adminMessage,
     "image": image
     };
  }
}
