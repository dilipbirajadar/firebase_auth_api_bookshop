import 'package:flutter/material.dart';


class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({super.key, required this.onTap});
  bool isFavorite = false;
  final Function(bool) onTap;

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  int _favoriteCount = 10;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    void toggleFavorite() {
      setState(() {
        if (widget.isFavorite) {
          _favoriteCount -= 1;
          widget.isFavorite = false;
        } else {
          _favoriteCount += 1;
          widget.isFavorite = true;
        }
      });
      widget.onTap(widget.isFavorite);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: deviceHeight(context)*0.03,

          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (widget.isFavorite
                ? Icon(
                    Icons.favorite,
                    size: deviceHeight(context) * 0.02,
                  )
                : Icon(Icons.favorite_border,
                    size: deviceHeight(context) * 0.02)),
            color: Colors.red,
            onPressed: toggleFavorite,
          ),
        ),
      ],
    );
  }
}
