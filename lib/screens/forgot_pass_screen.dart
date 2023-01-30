
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'otp_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(40),
        alignment: Alignment.center,
        color: Color(0xFFF0F6F1),
        child: Column(
          children: [
            Image.asset("images/lock_image.png", height: 120,),
            const Text(
              textAlign: TextAlign.center,
              "Forgot Password ?",
              style: TextStyle(
                  color: Color.fromRGBO(21,100,52, 0.8),
                  fontSize: 45.0, height: 1.4,
                  fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text("Don't worry it happens, please enter the details associated with your account",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize: 30)),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email / Mobile",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0))
                      )
                  ),
                ),
              )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Material(
              elevation: 5,
              color: Color.fromRGBO(21,100,52, 0.8),
              // borderRadius: BorderRadius.circular(0.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(),
                      ));
                },
                minWidth: 300.0,
                height: 45.0,
                child: const Text(
                  "Get OTP",
                  style:
                  TextStyle(color:Colors.white,fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
