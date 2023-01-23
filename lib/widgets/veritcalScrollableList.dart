import 'package:flutter/material.dart';


class VerticalListWidget extends StatefulWidget {
  VerticalListWidget({ super.key});


  @override
  State<VerticalListWidget> createState() => _VerticalListWidgetState();
}

class _VerticalListWidgetState extends State<VerticalListWidget> {


  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    // setState(() {});

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Center(child:  SizedBox(
        width: deviceWidth(context) ,
        height: deviceHeight(context) * 0.18,

        child:  Row(
      children: [
      Container(
      width: deviceWidth(context)*0.2,
        height: deviceHeight(context) * 0.15,
        child: Image(
          image: NetworkImage(
              'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361293878l/4248.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: deviceWidth(context)*0.8,
        height: deviceHeight(context) * 0.15,
        child: Column(
          children: [
            Container(
              height: deviceHeight(context) * 0.03,
              width: deviceWidth(context)*0.8,

            ),
            Container(
                height: deviceHeight(context) * 0.03,
                width: deviceWidth(context)*0.8,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('The Casual Vacancy',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600
                    ),),
                )

            ),
            Container(
                height: deviceHeight(context) * 0.04,
                width: deviceWidth(context)*0.8,
                child: Text('By JK Rowling',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400
                  ),),
            ),
            Container(
                height: deviceHeight(context) * 0.04,
                width: deviceWidth(context)*0.8,
              child: Row(
                children: [
                  Container(
                      height: deviceHeight(context) * 0.04,
                      width: deviceWidth(context)*0.6,
                      padding: EdgeInsets.only(left: 10),
                    child: Text('₹145',
                    style: TextStyle(
                      fontSize: 10
                    ),),
                  ),
                  Container(
                      height: deviceHeight(context) * 0.04,
                      width: deviceWidth(context)*0.2,
                      child:  ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green
                        ),
                        onPressed: () {  },
                        child: Text('Add',
                          style: TextStyle(
                            fontSize: 10,
                          ),),
                      ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      ],
    ),
      ),)

    );
  }
}