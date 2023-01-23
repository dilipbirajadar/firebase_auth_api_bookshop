import 'package:flutter/material.dart';

class CircularWidget extends StatefulWidget {
  CircularWidget({ super.key});


  @override
  State<CircularWidget> createState() => _CircularWidgetState();
}

class _CircularWidgetState extends State<CircularWidget> {
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
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) =>   Container(
        width: deviceWidth(context) * 0.2,
        height: deviceHeight(context) * 0.1,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'images/google_image.png'), //NetworkImage
              radius: deviceHeight(context)*0.04,
            ),
            Text('Title',
            style: TextStyle(
              fontSize: 10
            ),)
          ],

        ),
      ),
    );
  }
}
