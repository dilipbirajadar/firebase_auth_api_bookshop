import 'package:flutter/material.dart';

class SellBookScreen extends StatefulWidget {
  const SellBookScreen({Key? key}) : super(key: key);

  @override
  State<SellBookScreen> createState() => _SellBookScreenState();
}

class _SellBookScreenState extends State<SellBookScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(title: const Text('Sell Books'),backgroundColor: Colors.green,),
      body: Container(
          height: height/2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                const Text('Sell Book Page',style: TextStyle(color: Colors.green, fontSize: 28, fontWeight: FontWeight.bold),),

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
