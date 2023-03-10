import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../model/books.dart';

import 'cart_image.dart';

class BooksListView extends StatelessWidget {
  //int price;
  List<BooksModelResponseData> booksData = <BooksModelResponseData> [] ;
  int index;
  //double totalprice;
  /*BooksListView(
    this.price,
    //this.totalprice
  );*/

  BooksListView(this.booksData,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
      child: ListTile(
        title: Text(booksData[index].name), //book name returned from api
        subtitle: Text(booksData[index].author), //Author name returned from api
        leading: Column(
          children: const [
            CartImage(),
            //transform(),
          ],
        ),
        trailing: Column(
          children: [

            Text('#${booksData[index].price}',
                style:
                    const TextStyle(color: Colors.green)), //price returned from api
            const SizedBox(height: 2),
            const Icon(
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
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 150,
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: TextFormField(
              readOnly: true,
              textAlign: TextAlign.justify,
              style: const TextStyle(
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
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: ElevatedButton(
              onPressed: null,
              child: const Text(
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
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: ListView(physics: const NeverScrollableScrollPhysics(),
          //padding: EdgeInsets.only(bottom: 100),
          children: [
            ListTile(
              title: Text('Sub Total ($countofbooks books)',
                  style: const TextStyle(
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
                const SizedBox(height: 10),
                Text('#$totalprice',
                    style: const TextStyle(
                        color: Colors.black)), //price returned from api
                const SizedBox(height: 2),
                const Text(
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
                      //Navigator.pushNamed(context, '/checkout');
                      Navigator.pushNamed(
                        context,
                        '/checkout',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "CHECKOUT",
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
