import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildScaffoldBorder(),
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: buildAppbar(),
        body: Body(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: greenColor,
            child: const Icon(
              Icons.filter_list,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: CircularNotchedRectangle(),
          child: Container(
            color: bgColor,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding / 2, bottom: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 10,
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'assets/icons/tile.svg',
                      width: 24,
                      color: greenColor,
                    ),
                  ),
                  MaterialButton(
                    minWidth: 10,
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'assets/icons/row.svg',
                      color: greyTextColor,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildScaffoldBorder() {
    return BoxDecoration(
      border: Border(
        left: BorderSide(
          color: greenColor,
          width: kDefaultPadding / 4,
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      toolbarHeight: kDefaultPadding * 2,
      backgroundColor: bgColor,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Text(
          "Hello",
          style: TextStyle(
            color: greyTextColor,
            fontSize: 22,
            letterSpacing: 1,
          ),
        ),
      ),
      actions: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: greenColor,
              ),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 4,
              ),
            )
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.graphic_eq,
            color: greenColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
