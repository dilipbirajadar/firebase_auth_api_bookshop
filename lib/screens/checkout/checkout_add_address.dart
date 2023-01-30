import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:book_recycler/screens/checkout/checkout_screen.dart';
import 'package:book_recycler/screens/checkout/checkout_with_address.dart';
import 'package:book_recycler/model/globals.dart' as globals;
import 'package:book_recycler/model/address.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 246, 241),
      appBar: AppBar(
        title: const Text(
          'Add Address',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          addresstextwidget("*Required fields."),
          addresssubdivisionone(),
          addresssubdivisiontwo(),
          const addresssubdivisionthree(),
          const addressconfirm(),
        ],
      )),
    );
  }
}

class addresssubdivisionone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 5.0),
      height: 295,
      width: 400,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            child: addresssubtext("Recipents Information"),
          ),
          textfieldwidget(
              "Name and Surname*", 40, 400, 10, 5, 10, 10, globals.addressname),
          Container(
            child: Row(children: [
              //textfieldwidget("+91", 40, 70, 10, 5, 10, 5),
              const phonefield(),
              textfieldwidget(
                  "Phone Number*", 40, 190, 10, 5, 10, 25, globals.phoneNumber),
            ]),
          ),
          addresstextwidget("For shipping related questions only"),
          textfieldwidget(
              "E-mail Address*", 40, 400, 10, 5, 10, 10, globals.email),
          addresstextwidget(
              "This address will be used to send you order and bill details"),
        ],
      ),
    );
  }
}

class addresssubdivisiontwo extends StatelessWidget {
  addresssubdivisiontwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 5.0),
      height: 305,
      width: 400,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            child: addresssubtext("Recipents Information"),
          ),
          textfieldwidget("Address Title (Optional)", 40, 400, 10, 5, 10, 10,
              globals.addresstitle),
          addressfieldwithnavigator(globals.address),
          const streetaddresstextwidget(),
          cityfield("City*", globals.city),
          cityfield("State*", globals.state),
        ],
      ),
    );
  }
}

class addresssubdivisionthree extends StatelessWidget {
  const addresssubdivisionthree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 5.0),
      height: 119,
      width: 400,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            child: addresssubtext("Billing Information"),
          ),
          const billinginfowidget(),
        ],
      ),
    );
  }
}

class addresstextwidget extends StatelessWidget {
  String text;
  addresstextwidget(
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
            color: Colors.blueGrey,
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class addressconfirm extends StatefulWidget {
  const addressconfirm({super.key});

  @override
  State<addressconfirm> createState() => _addressconfirmState();
}

class _addressconfirmState extends State<addressconfirm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      //padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
      height: 60,
      width: 400,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        //color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 170,
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: OutlinedButton(
                    child: const Text('CANCEL'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.teal,
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        '/checkout',
                      );
                    },
                  ),
                ),
                Container(
                    height: 60,
                    width: 170,
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: OutlinedButton(
                      child: const Text('SAVE'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkoutwithaddress',
                            arguments: Address(
                                addressname: globals.addressname.text,
                                phoneNumber: globals.phoneNumber.text,
                                email: globals.email.text,
                                addresstitle: globals.addresstitle.text,
                                address: globals.address.text,
                                city: globals.city.text,
                                state: globals.state.text));
                        print('Pressed');
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class addresssubtext extends StatelessWidget {
  String text;
  addresssubtext(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
      //child: Align(
      // alignment: Alignment.topLeft,
      child: Row(children: [
        const SizedBox(height: 10, width: 20),
        Container(
          //margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          child: const Icon(Icons.circle_rounded, color: Colors.green),
        ),
        const SizedBox(height: 10, width: 10),
        Container(
          child: (Text(
            "$text",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ]),
      //),
    );
  }
}

class phonefield extends StatelessWidget {
  const phonefield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 100,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: IntlPhoneField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        )
        //),
        );
  }
}

class addressfieldwithnavigator extends StatelessWidget {
  var txt = TextEditingController();
  addressfieldwithnavigator(this.txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 400,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: TextFormField(
        controller: txt,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.black12,
          fontSize: 13,
        ),
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.ac_unit_rounded),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelText: "Address*",
          labelStyle: TextStyle(
            fontSize: 13,
          ),
          hintText: "Street, apartment name etc",
          hintStyle: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ),
      //),
    );
  }
}

class cityfield extends StatelessWidget {
  String text;
  var txt = TextEditingController();
  cityfield(this.text, this.txt);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 400,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: TextFormField(
        controller: txt,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.black12,
          fontSize: 13,
        ),
        decoration: InputDecoration(
            suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
            border:
                const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            hintStyle: const TextStyle(color: Colors.black),
            hintText: "$text"),
      ),
      //),
    );
  }
}

class streetaddresstextwidget extends StatelessWidget {
  const streetaddresstextwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
      child: Row(children: [
        const SizedBox(height: 10, width: 20),
        Container(
          child: const Icon(Icons.add, color: Colors.green),
        ),
        const SizedBox(height: 10, width: 10),
        Container(
          child: (const Text(
            "Street Address 2 (Optional)",
            style: TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ]),
      //),
    );
  }
}

class billinginfowidget extends StatefulWidget {
  const billinginfowidget({super.key});

  @override
  State<billinginfowidget> createState() => _checkboxState();
}

class _checkboxState extends State<billinginfowidget> {
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.fromLTRB(00.0, 0.0, 10.0, 10.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Billing Address*",
                //textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: CheckboxListTile(
                value: check,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    check = value;
                  });
                },
                title: const Text(
                  "Same as Delivery Address",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
