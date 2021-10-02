import 'package:flutter/services.dart';
import 'package:seller/models/category.dart';
import 'package:seller/models/product.dart';

class ProductAPI{
  static String getProductApi = "assets/json/product.json";
  static String getProductsApi = "assets/json/products.json";
  static String getCategoriesApi = "assets/json/categories.json";
  static String likeProductApi = "www.example.com/user/likeProduct/";
  Future<List<ProductInfo>?> getProducts(String category, String subCategory) async {
    // Uri url = Uri.parse(getProductsApi+ "/$category/$subCategory");
    // http.Response response = await http.get(url);
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return User.fromMap(responseHandler.bodyDecoded);
    // }else {
    //   return null;
    // }
    /*
    */
    // for testing we use local json file:
    String jsonData = await rootBundle.loadString(getProductsApi);
    return ProductInfo.fromJsonList(jsonData);
  }
  Future <List<ProductInfo>?> getMoreProducts(String category, String subCategory, int startFromIndex) async {
    /*
    */
    // for testing we use local json file:
    String jsonData = await rootBundle.loadString(getProductsApi);
    return ProductInfo.fromJsonList(jsonData);
  }
  Future<List<CategoryInfo>> getCategories()async {
    /*
    */
    // for testing we use local json file:
    String jsonData = await rootBundle.loadString(getCategoriesApi);
    return CategoryInfo.fromJsonList(jsonData);
  }
  Future<bool> likeProduct(int userPhoneNumber, String productId, bool liked) async {
    // Uri url = Uri.parse(likeProductApi);
    // Map data = {
    //   "product": productId,
    //   "user": productId,
    //   "liked": liked
    // };
    // http.Response response = await http.post(url, body: data);
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return true;
    // }else {
    //   return false;
    // }
    /*
    */
    // for testing return true:
    return true;
  }
 }