class BooksModelResponseData{
  /**
   *  "img": "gs://book-recycler-1864f.appspot.com/onehundredyearsofsolitude.png",

      "name":"One Hundred Years of Solitude",

      "description" : "One Hundred Years of Solitude is a 1967 novel by Colombian author Gabriel García Márquez that tells the multi-generational story of the Buendía family, whose patriarch, José Arcadio Buendía, founded the fictitious town of Macondo. The novel is often cited as one of the supreme achievements in world literature.",

      "ratings" : 4.2,

      "author" : "Gabriel García Márquez",

      "price" : 200,

      "ISBN" : "5263523362",

      "binding" : "Paperback",

      "edition" : "",

      "language" : "English",

      "condition" : "Very Good",

      "category" : "Fiction",

      "most popular" : true
   */

  String name = "";
  String description = "";
  String imageName = "";
  double ratings = 0.0;
  String author = "";
  int price = 0;
  String isbn = "";
  String binding = "";
  String language = "";
  String condition = "";
  String category = "";
  bool mostPopular = false;



  //Named constructor
  BooksModelResponseData.name(this.name, this.description, this.imageName,this.ratings,this.author,
      this.price,this.isbn,this.binding,this.language,this.condition,this.category,this.mostPopular);

  BooksModelResponseData.fromJson(Map<String, dynamic> json)
      :     name = json['name'],
        description = json['description'],
        imageName = json['img'],
        ratings = json['ratings'],
        author = json['author'],
        price = json['price'],
        isbn = json['ISBN'],
        binding = json['binding'],
        language = json['language'],
        condition = json['condition'],
        category = json['category'],
        mostPopular = json['most popular'];

  // convert RecipeData to json
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'img': imageName,
      'name': name,
      'ratings':ratings,
      'author':author,
      'price': price,
      'ISBN': isbn,
      'binding':binding,
      'language':language,
      'condition':condition,
      'category':category,
      'mostPopular':mostPopular,

    };
  }


}