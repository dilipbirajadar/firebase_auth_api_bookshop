import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(title: const Text('Profile'),backgroundColor: Colors.green,),
      body: Container(
          height: height/2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                const Text('Profile Page',style: TextStyle(color: Colors.green, fontSize: 28, fontWeight: FontWeight.bold),),

                const SizedBox(width: 10,height: 10,),

                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/add');
                } , child: const Text('Add',)),

                const SizedBox(width: 10,height: 10,),

              ],
            ),
          )

      ),
    );
  }
}
