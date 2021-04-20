import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';
import 'package:lab04/models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Expanded(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: product.color,
            border: Border.all(
              color: greyTextColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.favorite,
                  color: product.id == 2 ? greenColor : Colors.white,
                ),
              ),
              Column(
                children: <Widget>[
                  Hero(
                    tag: "${product.id}",
                    child: Image.asset(product.image),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 4),
                    child: Text(
                      product.title,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      color: product.id == 1 ? Colors.white : greyTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
