import 'package:flutter/material.dart';
import 'package:book_recycler/model/address.dart';
import 'package:book_recycler/screens/checkout/checkout_screen.dart';
import 'package:book_recycler/model/globals.dart' as globals;

class CheckoutWithAddress extends StatelessWidget {
  late String addressname;
  late String phoneNumber;
  late String email;

  late String addresstitle;
  late String address;
  late String city;
  late String state;

  CheckoutWithAddress({super.key});

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

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 246, 241),
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textwidget("Shipping"),
            Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                height: 162,
                width: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Column(children: [
                        SizedBox(height: 10, width: 20),
                        Container(
                          child: Row(
                            children: [
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
                              SizedBox(height: 10, width: 262),
                              Container(
                                child: InkWell(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.green,
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/addaddress',
                                      );
                                    }),
                              ),
                            ],
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
                        checkoutaddressinfo(),
                        SizedBox(height: 10, width: 20),
                      ]),
                    ),
                  ],
                )),
            textwidget("Payment"),
            creditcardwidget(),
            SizedBox(height: 30),
            paynowlistview(globals.totalPriceSum),
          ],
        ),
      ),
    );
  }
}

class checkoutaddressinfo extends StatefulWidget {
  const checkoutaddressinfo({super.key});

  @override
  State<checkoutaddressinfo> createState() => _checkoutaddressinfoState();
}

class _checkoutaddressinfoState extends State<checkoutaddressinfo> {
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: //Align(
          //alignment: Alignment.topLeft,
          CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        value: check,
        checkColor: Colors.white,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? value) {
          setState(() {
            check = value;
          });
        },
        title: Text(
          "Billing and delivery addresses are same.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      //),
    );
  }
}
