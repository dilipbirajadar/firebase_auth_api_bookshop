import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../../model/globals.dart';
import 'cart_image.dart';
import 'transform.dart';
import 'cart_list_view.dart';
import 'package:book_recycler/model/globals.dart' as globals;

class CartCardScreen extends StatefulWidget {
  const CartCardScreen({super.key});

  @override
  State<CartCardScreen> createState() => _cartState();
}

class _cartState extends State<CartCardScreen> {

  totalItemsPrice() {
    for (var i = 0; i < entries.length; i++) {
      globals.totalPriceSum = entries[i] + globals.totalPriceSum;
      //totalPriceSum = snapshot.data.fold(0, (previousValue, element) => previousValue + int.tryParse(User.fromMap(item).price));
    }
    print(globals.totalPriceSum);
    return globals.totalPriceSum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 246, 241),
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: entries.length, //count  returned from api
                itemBuilder: ((context, index) {
                  if (globals.totalPriceSum == 0) {
                    totalItemsPrice();
                  }
                  return BooksListView(entries[
                      index]); // price from this list view is taken as output for calculating the total
                }),
              ),
            ),
            SizedBox(height: 40),
            promotionsbox(),
            SizedBox(height: 10),
            totallistview(entries.length, globals.totalPriceSum),
            SizedBox(height: 10),
            checkoutlistview(globals.totalPriceSum),
          ],
        ),
      ),
    );
  }
}
