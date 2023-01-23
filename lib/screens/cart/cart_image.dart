import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  const CartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(5),
      height: 50.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          //image: AssetImage("images/bathua_paratha.png"),
          image: NetworkImage('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361293878l/4248.jpg'),
          fit: BoxFit.cover, //change image fill type
        ),
      ),
    );
  }
}
