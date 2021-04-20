import 'package:flutter/material.dart';
import 'package:lab04/models/Product.dart';

import 'add_to_cart.dart';
import 'color_picker.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ProductTitleWithImage(product: product),
                    ColorPicker(product: product),
                    AddToCart(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

