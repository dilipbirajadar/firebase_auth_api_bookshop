import 'package:book_recycler/model/books.dart';
import 'package:book_recycler/model/globals.dart';
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
   List<BooksModelResponseData> booksList =  <BooksModelResponseData>[];

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
              itemBuilder: (BuildContext context, int index) => Center(child:  Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
                padding: EdgeInsets.all(5),
                width: deviceWidth(context)*1 ,
                height: deviceHeight(context) * 0.18,

                child:  Row(

                  children: [
                    Container(
                      width: deviceWidth(context)*0.2,
                      height: deviceHeight(context) * 0.15,
                      child:
                      const Image(image: NetworkImage('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361293878l/4248.jpg'),
                      //Image(image: NetworkImage(snapshot.data![index].imageName),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: deviceWidth(context)*0.7,
                      height: deviceHeight(context) * 0.15,
                      child: Column(
                        children: [
                          Container(
                            height: deviceHeight(context) * 0.03,
                            width: deviceWidth(context)*0.8,

                          ),
                          Container(
                              height: deviceHeight(context) * 0.03,
                              width: deviceWidth(context)*0.65,
                              padding: const EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(snapshot.data![index].name,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600
                                  ),),
                              )

                          ),
                          Container(
                            height: deviceHeight(context) * 0.04,
                            width: deviceWidth(context)*0.65,
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(snapshot.data![index].author,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                          ),
                          Container(
                            height: deviceHeight(context) * 0.04,
                            width: deviceWidth(context)*0.7,
                            child: Row(
                              children: [
                                Container(
                                  height: deviceHeight(context) * 0.04,
                                  width: deviceWidth(context)*0.5,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('??? ${snapshot.data![index].price}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 5),
                                  height: deviceHeight(context) * 0.04,
                                  width: deviceWidth(context)*0.2,
                                  child:  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green
                                    ),
                                    /**
                                     * avigator.pushNamed(
                                        context,
                                        '/recipe_details',
                                        arguments: {
                                        'recipe_data': snapshot.data?[index],
                                        'index': index,
                                        },
                                        );
                                     */
                                    //onPressed: () { Navigator.pushNamed(context, '/cart',arguments: {'books_data_list':snapshot.data![index]}); },
                                    onPressed: () {
                                      booksList.add(snapshot.data![index]);
                                      globalBooksList = booksList;

                                      print(globalBooksList.length);
                                      print(globalBooksList![0].price);
                                      },
                                    child: const Text('ADD',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300
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
        return const SizedBox(
          height: 5.0,
          width: 120.0,
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}