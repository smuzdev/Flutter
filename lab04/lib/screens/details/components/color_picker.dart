import 'package:flutter/material.dart';
import 'package:lab04/models/Product.dart';

import '../../../constants.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ColorDot(
                  color: Colors.deepPurple,
                  isSelected: true,
                ),
                ColorDot(color: Colors.yellow),
                ColorDot(color: Colors.lightGreen),
                ColorDot(color: Colors.cyanAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding,
        right: kDefaultPadding / 4,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
          )),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
