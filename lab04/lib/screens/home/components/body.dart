import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';
import 'package:lab04/models/Product.dart';
import 'package:lab04/screens/details/details_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          child: Text(
            "Manoj",
            style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 22,
                color: whiteColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: Categories(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
