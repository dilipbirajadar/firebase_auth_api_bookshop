import 'package:book_recycler/blocs/get_all_books_blocs.dart';
import 'package:book_recycler/screens/home_screen.dart';
import 'package:book_recycler/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/circular_scrollable.dart';
import '../widgets/horizontal.dart';
import '../widgets/search_bar.dart';
import '../widgets/veritcalScrollableList.dart';

class BuyBooksScreen extends StatelessWidget {
  const BuyBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: //AppBar(title: const Text('Buy Books'),backgroundColor: Colors.green),
      AppBar(
        title:const Text('Buy Books') ,
        backgroundColor: Colors.green,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 22, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Column(
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
              margin: EdgeInsets.only(top: deviceHeight(context)*0.02),
              height: deviceHeight(context)*0.04,
              width: deviceWidth(context),
              child: Text('MOST POPULAR')
          ),
          Container(
              margin: EdgeInsets.only(top: deviceHeight(context)*0.01),
              height: deviceHeight(context)*0.25,
              width: deviceWidth(context),
              child: HorizontalWidget()
          ),
          Container(
              margin: EdgeInsets.only(top: deviceHeight(context)*0.02),
              height: deviceHeight(context)*0.04,
              width: deviceWidth(context),
              child: Text('All Books')
          ),
          Container(
            height: deviceHeight(context)*0.25,
            child:
            VerticalListWidget(),
          )

        ],
      ),

    );
  }
}
