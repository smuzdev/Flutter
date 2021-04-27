import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';
import 'package:lab04/models/Product.dart';
import 'package:lab04/screens/about/about_screen.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildAppBar(context),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: <Widget>[
          Body(product: product),
          AboutScreen(product: product),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: greenColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: greyTextColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}