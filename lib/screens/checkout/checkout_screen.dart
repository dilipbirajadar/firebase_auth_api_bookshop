import 'package:flutter/material.dart';
import 'package:book_recycler/model/globals.dart' as globals;

import '../../model/address.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 246, 241),
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
          const shippingwidget(),
          textwidget("Payment"),
          const creditcardwidget(),
          const SizedBox(height: 30),
          paynowlistview(globals.totalPriceSum),
        ],
      )),
    );
  }
}

class textwidget extends StatelessWidget {
  String text;
  textwidget(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      //padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "$text",
          //textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class shippingwidget extends StatelessWidget {
  const shippingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      height: 50,
      width: 400,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Row(children: [
        const SizedBox(height: 10, width: 20),
        Container(
          child: const Icon(
            Icons.local_shipping_outlined,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10, width: 20),
        Container(
          child: (const Text(
            "Add Address",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          )),
        ),
        const SizedBox(height: 10, width: 160),
        Container(
          child: InkWell(
              child: const Icon(
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
      ]),
    );
  }
}

class creditcardwidget extends StatefulWidget {
  const creditcardwidget({super.key});

  @override
  State<creditcardwidget> createState() => _creditcardwidgetState();
}

class _creditcardwidgetState extends State<creditcardwidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
        height: 260,
        width: 400,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        child: Column(children: [
          Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(children: [
                const SizedBox(height: 10, width: 20),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: const Icon(
                    Icons.credit_card_outlined,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10, width: 20),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: (const Text(
                    "Add Credit/Debit Card",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                ),
              ]),
            ),
          ),
          textfieldwidget(
              "Card Holder's Name", 40, 400, 10, 5, 10, 10, globals.creditcardname),
          textfieldwidget(
              "Card Number", 40, 400, 10, 5, 10, 10, globals.creditcardnumber),
          Container(
            margin: const EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
            child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Expiry Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                )),
          ),
          Container(
            child: Row(children: [
              textfieldwidget("Month", 40, 150, 10, 5, 10, 5, globals.month),
              textfieldwidget("Year", 40, 150, 10, 5, 10, 5, globals.year),
            ]),
          ),
          textfieldwidget(
              "Security Code", 40, 110, 10, 5, 220, 9, globals.securitycode),
        ]));
  }
}

class textfieldwidget extends StatelessWidget {
  String cardtext;
  double height;
  double width;
  double marginleft;
  double marginright;
  double marginbottom;
  double margintop;
  var txt = TextEditingController();
  textfieldwidget(this.cardtext, this.height, this.width, this.marginleft,
      this.margintop, this.marginright, this.marginbottom, this.txt);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin:
          EdgeInsets.fromLTRB(marginleft, margintop, marginright, marginbottom),
      //padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      //child: Align(
      //  alignment: Alignment.topLeft,
      child: TextFormField(
        controller: txt,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        decoration: InputDecoration(
            border:
                const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            hintStyle: const TextStyle(color: Colors.black),
            hintText: "$cardtext"),
      ),
      //),
    );
  }
}

class paynowlistview extends StatelessWidget {
  double totalprice;
  paynowlistview(this.totalprice);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            ListTile(
              title: const Text('Total',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  )),
              subtitle: Text('# $totalprice',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if ((globals.creditcardname.text == "")) {

                        //print(globals.creditcardname.text);
                        //return null;
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Alert"),
                            content: const Text(
                                "Please Enter the Valid Details to continue"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("okay"),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.pushNamed(context, '/paymentconfirmation',
                            arguments: Address(
                                addressname: globals.addressname.text,
                                phoneNumber: globals.phoneNumber.text,
                                email: globals.email.text,
                                addresstitle: globals.addresstitle.text,
                                address: globals.address.text,
                                city: globals.city.text,
                                state: globals.state.text));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],


              ),
            ),
          ]),
    );
  }
}
