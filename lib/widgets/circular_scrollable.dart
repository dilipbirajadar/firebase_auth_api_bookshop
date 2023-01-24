import 'package:book_recycler/model/category.dart';
import 'package:flutter/material.dart';

import '../model/category_model.dart';

class CircularWidget extends StatefulWidget {
  CircularWidget({ super.key});


  @override
  State<CircularWidget> createState() => _CircularWidgetState();
}

class _CircularWidgetState extends State<CircularWidget> {
  var tappedIndex = 0;
  late List<CategoryModel> categoryModel =  category;

  @override
  Widget build(BuildContext context) {

    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    // setState(() {});

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryModel.length,
      itemBuilder: (BuildContext context, int index) =>   Container(
        width: deviceWidth(context) * 0.2,
        height: deviceHeight(context) * 0.1,
        child: Column(
          children: [
            CircleAvatar(
              //backgroundImage: NetworkImage('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361293878l/4248.jpg'), //NetworkImage
              backgroundImage: NetworkImage(categoryModel[index].url), //NetworkImage
              radius: deviceHeight(context)*0.04,
            ),

            const SizedBox(width: 1 ,height: 1,),

            Text(categoryModel[index].name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ),)
          ],

        ),
      ),
    );
  }
}
