import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/address.dart';
import 'package:book_recycler/model/globals.dart' as globals;
import '../cart/cart_list_view.dart';
import 'checkout_screen.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  PaymentConfirmationScreen({super.key});

  getcurrentdate() {
    var date = DateTime.now().toString();
    var dateformated = DateFormat.yMd().add_jm().format(DateTime.now());
    return "Time Placed: $dateformated IST";
  }

  @override
  Widget build(BuildContext context) {
    double totalprice = globals.totalPriceSum;
    final routingArgument =
        ModalRoute.of(context)!.settings.arguments as Address;
    String email = routingArgument.email;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 246, 241),
      appBar: AppBar(
        title: const Text(
          'Order Confirmation',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Confirmtextwidget(),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'we sent an email to '),
                          TextSpan(
                              text: '$email',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: ' with your order confirmation and bill'),
                        ],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 5.0, 120.0, 10.0),
                    child: Text(
                      getcurrentdate(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            textwidget("Shipping"),
            Billingwidget(),
            textwidget("Billing"),
            Billingwidget(),
            textwidget("Your Order"),
            listviewWidget(),
            textwidget("Summary"),
            Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Text('SubTotal'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    trailing: Text('\$0,00'),
                  ),
                  ListTile(
                    leading: Text('Shipping'),
                    trailing: Text('\$0,00'),
                  ),
                  Divider(
                    color: Colors.white, //color of divider
                    // width: 10, //width space of divider
                    thickness: 3, //thickness of divier line
                    indent: 10, //Spacing at the top of divider.
                    endIndent: 10, //Spacing at the bottom of divider.
                  ),
                  ListTile(
                    leading: Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text('\$$totalprice'),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/checkout');
                  Navigator.pushNamed(
                    context,
                    '/buy_books',
                  );
                },
                child: Text(
                  "CONTINUE SHOPPING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Billingwidget extends StatelessWidget {
  late String addressname;
  late String phoneNumber;
  late String email;

  late String addresstitle;
  late String address;
  late String city;
  late String state;

  Billingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final routingArgument =
        ModalRoute.of(context)!.settings.arguments as Address;
    addressname = routingArgument.addressname;
    phoneNumber = routingArgument.phoneNumber;
    email = routingArgument.email;
    addresstitle = routingArgument.addresstitle;
    address = routingArgument.address;
    city = routingArgument.city;
    state = routingArgument.state;

    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      height: 100,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Column(
              children: [
                SizedBox(height: 10, width: 20),
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "$addressname",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "$email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "+91 $phoneNumber",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "$address,$city,$state",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class listviewWidget extends StatefulWidget {
  const listviewWidget({super.key});

  @override
  State<listviewWidget> createState() => _listviewWidgetState();
}

class _listviewWidgetState extends State<listviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: globals.entries.length, //count  returned from api
        itemBuilder: ((context, index) {
          return BooksListView(globals.entries[
              index]); // price from this list view is taken as output for calculating the total
        }),
      ),
    );
  }
}

class Confirmtextwidget extends StatelessWidget {
  const Confirmtextwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                height: 50.0,
                width: 60.0,
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      //height: 50.0,
                      //width: 60.0,
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 130.0, 0.0),
                      child: Text(
                        "Thank you!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Your order #AB123 has been placed.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
