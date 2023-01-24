import 'package:flutter/material.dart';
import '../model/most_popular_model.dart';
import '../model/most_popular_model_data.dart';
import 'books_card.dart';


class HorizontalWidget extends StatefulWidget {
  HorizontalWidget({ super.key});


  @override
  State<HorizontalWidget> createState() => _HorizontalWidgetState();
}

class _HorizontalWidgetState extends State<HorizontalWidget> {
  late List<MostPopular> mostPopularModel =  mostPopular;
  var tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    // setState(() {});

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mostPopularModel.length,
      itemBuilder: (BuildContext context, int index) => SizedBox(
          width: deviceWidth(context) * 0.35,
          height: deviceHeight(context) * 0.25,
          //child: CardWidget(),
          child: CardWidget(),
    ),
    );
  }
}
