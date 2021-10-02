import 'dart:convert';

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

  ProductInfo({required this.id,required this.title,required this.brand,required this.store, required this.category,
    required this.subCategory,required this.refLink,required this.desc,required this.price,required this.oldPrice,
    required this.images,required this.type, required this.divisions, required this.liked});

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
  static ProductInfo fromJson(String productJson) {
    return fromMap(jsonDecode(productJson));
  }
  static List<ProductInfo> fromJsonList(String jsonList){
    List productsList = jsonDecode(jsonList);
    return List.generate(productsList.length, (index) => fromMap(productsList[index]));
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
    };
  }
  String toJson() {
    return jsonEncode(toMap());
  }

}
