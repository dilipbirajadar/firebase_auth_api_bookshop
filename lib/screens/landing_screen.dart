import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
                      child: const Text(
                        'Book Recycler',
                        style: TextStyle(
                            color: Color.fromRGBO(21, 100, 52, 0.8),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(

                        image: DecorationImage(
                          image: AssetImage("images/landing.png"),
                          fit: BoxFit.fitHeight, //change image fill type
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      height: 132,
                      width: 250,
                      //color: Colors.blue,
                      //child: Align(
                      //alignment: Alignment.center,
                      child: const Text(
                        'Welcome to the Book Recycler Store , your one stop place for buying, selling or exchanging pre- owned books',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(21, 100, 52, 0.8),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          minWidth: 230.0,
                          height: 45.0,
                          child: const Text(
                            "GET STARTED",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
