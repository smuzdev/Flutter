import 'package:flutter/material.dart';
import 'package:lab04/models/Product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  final Product product;

  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            Hero(
              tag: "${product.id}",
              child: Image.asset(
                product.image,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                    top: kDefaultPadding * 10,
                    right: kDefaultPadding,
                ),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: greyTextColor,
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: greyTextColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: kDefaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.favorite,
                color: product.id == 2 ? greenColor : Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, top: kDefaultPadding / 2),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$${product.price}",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: greenColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
