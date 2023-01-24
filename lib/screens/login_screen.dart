import 'package:book_recycler/blocs/login_signup_blocs.dart';
import 'package:book_recycler/model/login_signup_model.dart';
import 'package:book_recycler/model/login_signup_response.dart';
import 'package:book_recycler/screens/signup_screen.dart';
import 'package:book_recycler/services/api_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'forgot_pass_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    late Future<LoginSignUpResponse> _clients;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void loginHandler() {
      /// Api login call
      if (emailController.value.text.isNotEmpty &&
          passwordController.value.text.isNotEmpty) {

        /// normal API call
        _clients = ApiHelper().postLogin(LoginSignUpModel(email: emailController.value.text, password: passwordController.value.text,returnSecureToken: 'true'));
        _clients.whenComplete(() => onLoginSuccess(context));

        ///bloc pattern api call
        loginBlock.doLogin(LoginSignUpModel(
            email: emailController.value.text,
            password: passwordController.value.text,
            returnSecureToken: 'true'));

        FutureBuilder<LoginSignUpResponse>(
            future: _clients ,
            builder: ((context, snapshot) {
          if (snapshot.hasData) {
           print('email ${snapshot.data?.idToken}');
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        })
        );

        /*StreamBuilder(
          stream: loginBlock.loginData,
          builder: (context, AsyncSnapshot<LoginSignUpResponse> snapshot) {
            print('inside block');
            if (snapshot.hasData) {
              //data arrives
              print('email in login page ${snapshot.data?.email}');
              onLoginSuccess(context);
            } else if (snapshot.hasError) {
              print('error ${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );*/

        //_clients.whenComplete(() => onLoginSuccess(context));
        //_clients.onError((error, stackTrace) => errorMethod(context,error) );

      } else {
        print('please enter email or password ');
      }
    }


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFF0F6F1),
        child: Column(
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: Color.fromRGBO(21, 100, 52, 0.8),
                  fontSize: 75.0,
                  height: 1.4,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            //   SizedBox(
            //   child: Center(
            //    child:
            //   Image.asset("images/login_above.png", height: 120,),
            //  ),
            // ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              // width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              // height: double.infinity,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //   SizedBox(
                    //    child: Center(
                    //   child:
                    //  Image.asset("images/login_below.png", height: 120,),
                    //    ),
                    //   ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.6,
                      child: Center(
                        child: TextField(
                          style: TextStyle(height: 2.3),
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)))),
                          controller: emailController,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),

                    // width: MediaQuery.of(context).size.width * 0.6,
                    Center(
                      child: TextField(
                        style: TextStyle(height: 1.0),
                        textAlign: TextAlign.left,
                        obscureText: passenable,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            suffix: IconButton(
                                onPressed: () {
                                  //add Icon button at end of TextField
                                  setState(() {
                                    //refresh UI
                                    if (passenable) {
                                      //if passenable == true, make it false
                                      passenable = false;
                                    } else {
                                      passenable =
                                          true; //if passenable == false, make it true
                                    }
                                  });
                                },
                                icon: Icon(passenable == true
                                    ? Icons.remove_red_eye
                                    : Icons.password))
                            //eye icon if passenable = true, else, Icon is ***__
                            ),
                        controller: passwordController,
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                              text: 'Forgot Password ?',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                                height: 1.4,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassScreen(),
                                      ));
                                }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Material(
                      elevation: 5,
                      color: Color.fromRGBO(21, 100, 52, 0.8),
                      child: MaterialButton(
                        onPressed: () {
                          loginHandler();
                        },
                        minWidth: 300.0,
                        height: 45.0,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    RichText(
                      // textAlign: TextAlign.right,
                      text: TextSpan(
                          text: 'or',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20.0,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // print('Privacy Policy"');
                            }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      // height: MediaQuery.of(context).size.height * 0.05,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                                child: Align(
                                  // alignment: Alignment.,
                                  child: Text(
                                    'LOG IN WITH GOOGLE',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              SizedBox(
                                  child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  "images/google_image.png",
                                  height: 20,
                                ),
                              )),
                            ],
                          ),
                          //Text
                        ), //Center
                      ), //Card
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                      // alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        // width: 300,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Card(
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'New to UsedBooks Store ?',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: RichText(
                                      textAlign: TextAlign.right,
                                      text: TextSpan(
                                          text: 'Register',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15.0,
                                            height: 1.4,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignupScreen(),
                                                  ));
                                              // print('Privacy Policy"');
                                            }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Text
                          ), //Center
                        ),
                      ),
                      //Card
                    ),
                  ]),
            ),
          ],


        ),
      ),
    );
  }
}


errorMethod(BuildContext context, Object? error) {}

onLoginSuccess(BuildContext context) {
  Navigator.pushNamed(context, '/home');
}

onCartClick(BuildContext context) {
  Navigator.pushNamed(context, '/cart');
}