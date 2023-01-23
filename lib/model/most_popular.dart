class MostPopularData{
  String name = "";
  String description = "";
  String imageName = "";
  int favourite = 0;
  String price = "";

 //Named constructor
  MostPopularData.name(this.name, this.description, this.imageName,
      this.favourite, this.price);

  MostPopularData.fromJson(Map<String, dynamic> json)
  :     name = json['name'],
        description = json['description'],
        imageName = json['image-name'],
        favourite = json['favourite'],
        price = json['price'];

  // convert RecipeData to json
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image-name': imageName,
      'name': name,
      'favourite': favourite,
      'price': price,
    };
  }

}