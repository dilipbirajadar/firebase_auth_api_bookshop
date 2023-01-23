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
    /// get all books
    _future = getAllBooks.getAllBooksList();
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
          print(snapshot.data?.length);
          /*return ListView.builder(
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
                      child: Image(
                        image: NetworkImage(
                            'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361293878l/4248.jpg'),
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
                                child: Text('The Casual Vacancy',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600
                                  ),),
                              )

                          ),
                          Container(
                            height: deviceHeight(context) * 0.04,
                            width: deviceWidth(context)*0.8,
                            child: Text('By JK Rowling',
                              style: TextStyle(
                                  fontSize: 11,
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
                                  child: Text('₹145',
                                    style: TextStyle(
                                        fontSize: 10
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

          );*/

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: InkWell(
                          onTap: () {
                            print("card ${index} is tapped.");
                            Navigator.pushNamed(
                              context,
                              '/recipe_details',
                              arguments: {
                                'recipe_data': snapshot.data?[index],
                                'index': index,
                              },
                            );
                            //RecipeDetailsScreen();
                          },
                          child: //Text('${snapshot.data?[index].name}'),
                          Image.asset(
                            'images/${snapshot.data?[index].imageName}.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      }),
    );

    /*return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Center(child:  SizedBox(
        width: deviceWidth(context) ,
        height: deviceHeight(context) * 0.18,

        child:  Row(
      children: [
      Container(
      width: deviceWidth(context)*0.2,
        height: deviceHeight(context) * 0.15,
        child: Image(
          image: NetworkImage(
              'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361293878l/4248.jpg'),
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
                  child: Text('The Casual Vacancy',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600
                    ),),
                )

            ),
            Container(
                height: deviceHeight(context) * 0.04,
                width: deviceWidth(context)*0.8,
                child: Text('By JK Rowling',
                  style: TextStyle(
                      fontSize: 11,
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
                    child: Text('₹145',
                    style: TextStyle(
                      fontSize: 10
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

    );*/
  }
}