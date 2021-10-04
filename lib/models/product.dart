import 'dart:convert';

import 'buying_info.dart';

class ProductInfo {
  final String id;
  final String title;
  final String brand;
  final String store;
  final String category;
  final String subCategory;
  final String refLink;
  final String desc;
  final double price;
  final double? oldPrice;
  final List images;
  final String type;
  final List divisions;
  bool liked;
  ProductBuyingInfo? buyingInfo;

  ProductInfo({required this.id,required this.title,required this.brand,required this.store, required this.category,
    required this.subCategory,required this.refLink,required this.desc,required this.price,required this.oldPrice,
    required this.images,required this.type, required this.divisions, required this.liked, this.buyingInfo});

  static ProductInfo fromMap(Map productInfo) {
    return ProductInfo(
      id: productInfo["id"],
        title: productInfo["title"],
        brand: productInfo["brand"],
        store: productInfo["store"],
        category: productInfo["category"],
        subCategory: productInfo["subCategory"],
        refLink: productInfo["refLink"],
        desc: productInfo["desc"],
        price: productInfo["price"],
      oldPrice: productInfo["oldPrice"],
        images: productInfo["images"],
        type: productInfo["type"],
        divisions: productInfo["divisions"],
        liked: productInfo["liked"],
    );
  }
  static List<ProductInfo> fromJsonList(String jsonList){
    List productsList = jsonDecode(jsonList);
    return fromMapList(productsList);
  }
  static List<ProductInfo> fromMapList(List mapList){
    return List.generate(mapList.length, (index) => fromMap(mapList[index]));
  }
  static ProductInfo fromSqlMap(Map<String,dynamic> productInfo){

    return ProductInfo(
      id: productInfo["id"],
      title: productInfo["title"],
      brand: productInfo["brand"],
      store: productInfo["store"],
      category: productInfo["category"],
      subCategory: productInfo["subCategory"],
      refLink: productInfo["refLink"],
      desc: productInfo["desc"],
      price: productInfo["price"],
      oldPrice: productInfo["oldPrice"],
      images: productInfo["images"].replaceFirst("[", "").replaceFirst("]", "").replaceFirst(" ", "").split(","),
      type: productInfo["type"],
      divisions: productInfo["divisions"].replaceFirst("[", "").replaceFirst("]", "").replaceFirst(" ", "").split(","),
      liked: productInfo["liked"] == 1,
    );
  }

  Map<String, Object?> toMap() {
    return {
      "title": title,
      "brand": brand,
      "store": store,
      "category": category,
      "subCategory": subCategory,
      "refLink": refLink,
      "desc": desc,
      "price": price,
      "oldPrice": oldPrice,
      "images": images,
      "type": type,
      "divisions": divisions,
      "liked": liked,
      "id": id
    };
  }
  Map<String, Object?> toSqlMap() {
    return {
      "title": title,
      "brand": brand,
      "store": store,
      "category": category,
      "subCategory": subCategory,
      "refLink": refLink,
      "desc": desc,
      "price": price,
      "oldPrice": oldPrice,
      "images": images.toString(),
      "type": type,
      "divisions": divisions.toString(),
      "liked": liked ? 1 : 0,
      "id": id
    };
  }
  String toJson() {
    return jsonEncode(toMap());
  }
  static String sqliteCartTable =
      'CREATE TABLE IF NOT EXISTS cart(id TEXT PRIMARY KEY,'
      ' title TEXT, brand TEXT, store TEXT, category TEXT,'
      ' subCategory TEXT, refLink TEXT, desc TEXT,'
      ' price REAL, oldPrice REAL, images TEXT, type TEXT,'
      ' divisions TEXT, liked INTEGER)';

}
