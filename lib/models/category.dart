import 'dart:convert';

class CategoryInfo{
  final String name;
  final List<String> subCategories;
  CategoryInfo({required this.name,required this.subCategories});

  static CategoryInfo fromMap(Map categoryInfo) {
    return CategoryInfo(
      name: categoryInfo["name"],
      subCategories: List<String>.from(categoryInfo["subCategories"])
    );
  }
  static List<CategoryInfo> fromJsonList(String jsonList){
    List categoriesList = jsonDecode(jsonList);
    return List.generate(categoriesList.length, (index) => fromMap(categoriesList[index]));
  }
}