import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'cart_image.dart';

class BooksListView extends StatelessWidget {
  int price;
  //double totalprice;
  BooksListView(
    this.price,
    //this.totalprice
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
      child: ListTile(
        title: Text('Book 1'), //book name returned from api
        subtitle: Text('Author'), //Author name returned from api
        leading: Column(
          children: [
            CartImage(),
            //transform(),
          ],
        ),
        trailing: Column(
          children: [
            SizedBox(height: 10),
            Text('#$price',
                style:
                    TextStyle(color: Colors.green)), //price returned from api
            SizedBox(height: 2),
            Icon(
              Icons.delete_outline,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class promotionsbox extends StatelessWidget {
  const promotionsbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 150,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: TextFormField(
              readOnly: true,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black12,
                fontSize: 13,
              ),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Voucher"),
            ),
          ),
          Container(
            height: 40,
            width: 150,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: ElevatedButton(
              onPressed: null,
              child: Text(
                "APPLY",
                // style: TextStyle(
                //   color: Colors.white,
                //   fontSize: 13,
                // ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.green;
                    return Colors.green;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class totallistview extends StatelessWidget {
  int countofbooks;
  double totalprice;
  totallistview(this.countofbooks, this.totalprice);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 400,
      //padding: EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: ListView(physics: NeverScrollableScrollPhysics(),
          //padding: EdgeInsets.only(bottom: 100),
          children: [
            ListTile(
              title: Text('Sub Total ($countofbooks books)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: const Text('Shipping',
                  style: TextStyle(
                    //color: Colors.black,
                    fontSize: 12,
                  )),
              trailing: Column(children: [
                SizedBox(height: 10),
                Text('#$totalprice',
                    style: TextStyle(
                        color: Colors.black)), //price returned from api
                SizedBox(height: 2),
                Text(
                  'FREE',
                  //style: TextStyle(color: Colors.black)
                ),
              ]),
            ),
          ]),
    );
  }
}

class checkoutlistview extends StatelessWidget {
  double totalprice;
  checkoutlistview(this.totalprice);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 40),
          children: [
            ListTile(
              title: const Text('Total',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  )),
              subtitle: Text('# $totalprice',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/checkout');
                      Navigator.pushNamed(
                        context,
                        '/checkout',
                      );
                    },
                    child: Text(
                      "CHECKOUT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
