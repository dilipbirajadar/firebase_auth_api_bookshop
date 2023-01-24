import 'package:badges/badges.dart';
import 'package:book_recycler/blocs/get_all_books_blocs.dart';
import 'package:book_recycler/model/globals.dart';
import 'package:book_recycler/screens/home_screen.dart';
import 'package:book_recycler/screens/login_screen.dart';
import 'package:book_recycler/shared/color.dart';
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
      backgroundColor: const Color.fromARGB(255, 240, 246, 241),
      appBar: //AppBar(title: const Text('Buy Books'),backgroundColor: Colors.green),
      AppBar(
        title: Text('Buy Books') ,
        backgroundColor: Colors.green,

        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {onCartClick(context);}),

          /*Badge(
            badgeContent: Text(globalBooksList.length.toString()),
            child: Icon(Icons.shopping_cart),
          )*/
        ],

        /*leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon:  Icon(
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
        actions: [Icon(Icons.shopping_cart)],*/

      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: deviceHeight(context)*0.02),
              height: deviceHeight(context)*0.05,
              width: deviceWidth(context)*1,
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
              height: deviceHeight(context)*0.26,
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
            width: deviceWidth(context),
            child:
            VerticalListWidget(),
          )

        ],
      ),

    );
  }
}

onCartClickData(BuildContext context){
  if(globalBooksList.isEmpty){
    //Dialog dialog = Dialog(child:  Text('Please add some book'),);
    print('please add some book to proceed further.');
    Navigator.pushNamed(context, '/cart');
  }else{
    Navigator.pushNamed(context, '/cart');
  }

}
