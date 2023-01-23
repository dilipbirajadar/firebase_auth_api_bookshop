import 'package:book_recycler/model/login_signup_response.dart';
import 'package:book_recycler/screens/buy_books_screen.dart';
import 'package:flutter/material.dart';

import '../blocs/login_signup_blocs.dart';
import '../model/login_signup_model.dart';
import '../services/api_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    late Future<LoginSignUpResponse> _clients;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final mobileController = TextEditingController();

    void signupHandler()  {
      if(emailController.value.text.isNotEmpty && passwordController.value.text.isNotEmpty){
        print(_formKey.currentState);
        print(emailController.text);
        _clients = ApiHelper().postSignup(LoginSignUpModel(email: emailController.value.text, password: passwordController.value.text,returnSecureToken: 'true'));
        _clients.whenComplete(() =>  Navigator.pushNamed(context, '/home'));

        ///block pattern api call
        loginBlock.doSignup(LoginSignUpModel(
            email: emailController.value.text,
            password: passwordController.value.text,
            returnSecureToken: 'true'));

      }else{
        print('please enter valid data');
      }
    };

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFF0F6F1),
        child: Column(
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                  color: Color.fromRGBO(21,100,52, 0.8),
                  fontSize: 75.0, height: 1.4,
                  fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Center(
                        child: TextField(
                          style: TextStyle(height: 2.5),
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(0.0))
                              )
                          ),
                          controller: emailController,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Center(
                        child: TextField(
                          style: TextStyle(height: 1.0),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.left,
                          maxLength: 10,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              hintText: "Mobile",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(0.0))
                              )
                          ),
                          controller: mobileController,
                        ),
                      ),
                    ),

                    // SizedBox(
                    //  height: MediaQuery.of(context).size.height * 0.01,
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Center(
                        child:TextField(
                          obscureText: true,
                          textAlign: TextAlign.left,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              hintText: "New Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(0.0))
                              ),
                              suffix: IconButton(onPressed: (){ //add Icon button at end of TextField
                                setState(() { //refresh UI
                                  if(passenable){ //if passenable == true, make it false
                                    passenable = false;
                                  }else{
                                    passenable = true; //if passenable == false, make it true
                                  }
                                });
                              }, icon: Icon(passenable == true?Icons.remove_red_eye:Icons.password))
                            //eye icon if passenable = true, else, Icon is ***__
                          ),
                          controller: passwordController,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Center(
                        child: TextField(
                          obscureText: true,
                          textAlign: TextAlign.left,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(0.0))
                              ),
                              suffix: IconButton(onPressed: (){ //add Icon button at end of TextField
                                setState(() { //refresh UI
                                  if(passenable){ //if passenable == true, make it false
                                    passenable = false;
                                  }else{
                                    passenable = true; //if passenable == false, make it true
                                  }
                                });
                              }, icon: Icon(passenable == true?Icons.remove_red_eye:Icons.password))
                            //eye icon if passenable = true, else, Icon is ***__
                          ),
                          controller: passwordController,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Material(
                      elevation: 5,
                      color: Color.fromRGBO(21,100,52, 0.8),
                      // borderRadius: BorderRadius.circular(0.0),
                      child: MaterialButton(
                        onPressed: () {
                          signupHandler();
                          ///show alert for signup
                          /*showDialog(context: context, builder: (context){
                            return Container(
                              child: AlertDialog(
                                title: Text("Successfully Registered!"),
                                backgroundColor: Color(0xFFF0F6F1),
                                actions: [
                                  TextButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyBooksScreen(),));
                                  }, child: Text("close"))
                                ],
                                content: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width:170,
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Container(
                                                  width: 30,
                                                  child: Image(image: AssetImage("images/dialogue_image1.png"),)
                                              ),
                                              Column(
                                                children: [
                                                  Text("You have successfully ", textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
                                                  Text("registered. You will now be ",textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
                                                  Text("redirected to the Login ",textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
                                                  Text("Screen",textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
                                                ],
                                              ),
                                            ],
                                          ),

                                        ),

                                      ),
                                    ],
                                  ),
                                ),

                              ),
                            );
                          });*/
                          //
                        },
                        minWidth: 300.0,
                        height: 45.0,
                        child: Text(
                          "Sign Up",
                          style:
                          TextStyle(color:Colors.white,fontWeight: FontWeight.w500, fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "By Signing Up, you agree to our ", style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize: 15)),
                          TextSpan(
                              text: 'Terms and',
                              style: TextStyle(fontFamily: 'Muli', color: Colors.blueAccent, fontSize: 15)),
                        ],
                      ),),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Conditions ", style: TextStyle(fontFamily: 'Muli', color: Colors.blueAccent, fontSize: 15)),
                          TextSpan(
                              text: 'and ',
                              style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize: 15)),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(fontFamily: 'Muli', color: Colors.blueAccent, fontSize: 15)),
                        ],
                      ),),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}



