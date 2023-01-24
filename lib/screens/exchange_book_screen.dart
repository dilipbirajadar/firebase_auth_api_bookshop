import 'package:flutter/material.dart';

import '../shared/color.dart';
import '../widgets/circular_scrollable.dart';
import '../widgets/horizontal.dart';
import '../widgets/search_bar.dart';
import '../widgets/veritcalScrollableList.dart';

class ExchangeBookScreen extends StatefulWidget {
  const ExchangeBookScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeBookScreen> createState() => _ExchangeBookScreenState();
}

class _ExchangeBookScreenState extends State<ExchangeBookScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 246, 241),
      appBar: AppBar(title: const Text('Exchange Books'),backgroundColor: Colors.green,),
      body: Container(

          child: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.02),
                    height: deviceHeight(context)*0.05,
                    width: deviceWidth(context),
                    child: SearchWidget()
                ),
                Container(
                    margin: EdgeInsets.only(top:deviceHeight(context)*0.02),
                    height: deviceHeight(context)*0.1,
                    width: deviceWidth(context),
                    child: CircularWidget()
                ),
                Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.02,left: 5,right: 5),
                    height: deviceHeight(context)*0.04,
                    width: deviceWidth(context),
                    child: const Text('MOST POPULAR',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:AppColor.secondaryColor
                        )
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.01,left: 5,right: 5),
                    height: deviceHeight(context)*0.25,
                    width: deviceWidth(context),
                    child: HorizontalWidget()
                ),
                Container(
                    margin: EdgeInsets.only(top: deviceHeight(context)*0.02,left: 5,right: 5),
                    height: deviceHeight(context)*0.04,
                    width: deviceWidth(context),
                    child: const Text('All Books',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:AppColor.secondaryColor
                        ))
                ),
                Container(
                  height: deviceHeight(context)*0.25,
                  child:
                  VerticalListWidget(),
                )

              ],

            )
          )

      ),
    );
  }
}
