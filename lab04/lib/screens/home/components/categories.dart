import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Popular", "Trending", "All"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: selectedIndex == index ? greenColor : greyTextColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 2),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: selectedIndex == index ? greenColor : Colors.transparent,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
