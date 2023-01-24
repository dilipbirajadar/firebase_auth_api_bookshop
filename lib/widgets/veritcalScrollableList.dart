import 'package:book_recycler/model/books.dart';
import 'package:flutter/material.dart';

import '../blocs/get_all_books_blocs.dart';
import '../services/api_helper.dart';


class VerticalListWidget extends StatefulWidget {
  VerticalListWidget({ super.key});


  @override
  State<VerticalListWidget> createState() => _VerticalListWidgetState();
}

class _VerticalListWidgetState extends State<VerticalListWidget> {
  late Future<List<BooksModelResponseData>> _future;

  @override
  void initState() {
    /// get all books with block patter
     //getAllBooks.getAllBooksList();
    _future = ApiHelper().getBooksNormal();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    // setState(() {});

    return FutureBuilder<List<BooksModelResponseData>>(
      future: _future,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {

          print('data in widget: ${snapshot.data?.length}');

          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) => Center(child:  SizedBox(
                width: deviceWidth(context) ,
                height: deviceHeight(context) * 0.18,

                child:  Row(
                  children: [
                    Container(
                      width: deviceWidth(context)*0.2,
                      height: deviceHeight(context) * 0.15,
                      child:
                      //Image(image: NetworkImage('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361293878l/4248.jpg'),
                      Image(image: NetworkImage(snapshot.data![index].imageName),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: deviceWidth(context)*0.8,
                      height: deviceHeight(context) * 0.15,
                      child: Column(
                        children: [
                          Container(
                            height: deviceHeight(context) * 0.03,
                            width: deviceWidth(context)*0.8,

                          ),
                          Container(
                              height: deviceHeight(context) * 0.03,
                              width: deviceWidth(context)*0.8,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(snapshot.data![index].name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600
                                  ),),
                              )

                          ),
                          Container(
                            height: deviceHeight(context) * 0.04,
                            width: deviceWidth(context)*0.8,
                            child: Text(snapshot.data![index].author,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                          ),
                          Container(
                            height: deviceHeight(context) * 0.04,
                            width: deviceWidth(context)*0.8,
                            child: Row(
                              children: [
                                Container(
                                  height: deviceHeight(context) * 0.04,
                                  width: deviceWidth(context)*0.6,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('₹ ${snapshot.data![index].price}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ),
                                Container(
                                  height: deviceHeight(context) * 0.04,
                                  width: deviceWidth(context)*0.2,
                                  child:  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green
                                    ),
                                    onPressed: () {  },
                                    child: Text('Add',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),)

          );

        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      }),
    );
  }
}