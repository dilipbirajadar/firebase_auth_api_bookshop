import 'package:flutter/material.dart';

import 'login_screen.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
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
            Image.asset("images/unlock.png", height: 120),

            Text(
              textAlign: TextAlign.center,
              "Reset Password",
              style: TextStyle(
                  color: Color.fromRGBO(21,100,52, 0.8),
                  fontSize: 45.0, height: 1.4,
                  fontWeight: FontWeight.w700
              ),
              // textAlign: TextAlign.left,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.left,
              onChanged: (value) {},
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "New Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0))
                  )
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.left,
              onChanged: (value) {},
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Confirm New Password",
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
                //  Navigator.push( context, MaterialPageRoute( builder: (context) => ResetPassScreen(),));
                  showDialog(context: context, builder: (context){
                    return Container(
                      child: AlertDialog(
                        title: Text("Password Updated"),
                        backgroundColor: Color(0xFFF0F6F1),
                        actions: [
                          TextButton(onPressed: () {
                            Navigator.push( context, MaterialPageRoute( builder: (context) => LoginScreen(),));
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
                                          Text("You have updated your ", textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
                                          Text("password successfully. You ",textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
                                          Text("will now be redirected to the ",textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
                                          Text("Login Screen",textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
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
                  });

                },
                minWidth: 300.0,
                height: 45.0,
                child: Text(
                  "SUBMIT",
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
