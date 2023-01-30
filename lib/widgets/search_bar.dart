import 'package:flutter/material.dart';

import '../shared/color.dart';


class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    // setState(() {});

    return Container(
      width: deviceWidth(context) * 1,
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColor.secondaryColor),
          color: Colors.white),
      child: Row(
        children: [
          Container(
            width: deviceWidth(context) * 0.1,
            height: deviceHeight(context) * 0.05,
            child: const Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
          ),
          Container(
              width: deviceWidth(context) * 0.8,
              height: deviceHeight(context) * 0.05,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom:deviceHeight(context) * 0.05/2 ),
                  border: InputBorder.none,
                  hintText: 'Search topics tiles or authors',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
