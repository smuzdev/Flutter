import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';

class Product {
    final String image, title;
    final int price, id;
    final Color color;

    Product({
        this.id,
        this.image,
        this.title,
        this.price,
        this.color,
    });
}

List<Product> products = [
Product(
      id: 1,
      title: 'Samurai',
      price: 119,
      image: "assets/images/skateboard_1.png",
      color: greenColor,
  Product(
      id: 2,
      title: "Blue Wave",
      price: 119,
      image: "assets/images/skateboard_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Amer Fly",
      price: 150,
      image: "assets/images/skateboard_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Splash",
      price: 110,
      image: "assets/images/skateboard_4.png",
      color: Color(0xFFE6B398)),
];