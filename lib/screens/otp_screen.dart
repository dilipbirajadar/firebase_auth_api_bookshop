
import 'package:flutter/material.dart';

import 'reset_pass_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              "Enter OTP",
              style: TextStyle(
                  color: Color.fromRGBO(21,100,52, 0.8),
                  fontSize: 45.0, height: 1.4,
                  fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text("Enter the 4 digit sent to your mobile / email",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize: 20,)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            TextField(
              style: TextStyle(backgroundColor: Colors.white),
              keyboardType: TextInputType.number,
              maxLength: 4,
              textAlign: TextAlign.left,
              onChanged: (value) {},
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "OTP",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0))
                  )
              ),
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
                        builder: (context) => ResetPassScreen(),
                      ));
                },
                minWidth: 300.0,
                height: 45.0,
                child: const Text(
                  "Submit",
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
