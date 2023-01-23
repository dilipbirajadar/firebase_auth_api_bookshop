import 'package:flutter/material.dart';

class transform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0.0, -8 / 2.0),
      child: Center(
        child: GestureDetector(
          onTap: () {/* do stuff */},
          child: Container(
            //height: 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  //offset: Offset(0.0, 2.0),
                  color: Colors.green,
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Text(
                    '4.9',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
