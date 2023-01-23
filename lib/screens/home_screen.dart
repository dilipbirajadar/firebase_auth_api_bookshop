import 'package:flutter/material.dart';

import 'buy_books_screen.dart';
import 'exchange_book_screen.dart';
import 'profile_screen.dart';
import 'sell_book_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //onBottom event click
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(index);
    if (index == 0) {
      _scaffoldKey.currentState!.openDrawer();
    } else {
      _pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    //take width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

     return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: const Text('Recipe App'),
      //   backgroundColor: AppColor.secondaryColor,
      // ),
      body: Center(
          child: PageView(
            controller: _pageController,
            children: const [
              BuyBooksScreen(),
              SellBookScreen(),
              ExchangeBookScreen(),
              ProfileScreen()

            ],
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
                title: const Text(
                  'John Deo',
                  style:
                  TextStyle(color: Colors.grey, fontSize: 18),
                ),
                subtitle: const Text(
                  'john.deo@gmail.com',
                  style:
                  TextStyle(color: Colors.grey, fontSize: 14),
                ),
                trailing: const Icon(Icons.arrow_circle_left),
                leading: const Icon(Icons.account_circle_rounded),
                onTap: () {},
              ),
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.person_off_rounded),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Order',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Sell',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.currency_rupee),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Exchange',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.currency_exchange),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Favorite',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.favorite),
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            ListTile(
              title: const Text(
                'FAQ',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.question_answer),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.contact_page),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'About the Phone',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.info),
              onTap: () {},
            ),

            ListTile(
              title: const Text(
                'Logout ',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              leading: const Icon(Icons.logout),
              onTap: () {},
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(backgroundColor:Colors.green,icon: Icon(Icons.account_balance_wallet), label: 'Buy'),
          BottomNavigationBarItem(backgroundColor:Colors.green,icon: Icon(Icons.currency_rupee), label: 'Sell'),
          BottomNavigationBarItem(backgroundColor:Colors.green,icon: Icon(Icons.currency_exchange), label: 'Exchange'),
          BottomNavigationBarItem(backgroundColor:Colors.green,icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
