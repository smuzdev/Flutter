import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';
import 'package:lab04/models/Product.dart';

class AboutScreen extends StatelessWidget {
  final Product product;

  const AboutScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          product.title,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: greenColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            product.description,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
