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
      image: "assets/images/1.png",
      color: greenColor
      ),
  Product(
      id: 2,
      title: "Blue Wave",
      price: 119,
      image: "assets/images/2.png",
      color: Colors.transparent
      ),
  Product(
      id: 3,
      title: "Amer Fly",
      price: 150,
      image: "assets/images/3.png",
      color: Colors.transparent
      ),
  Product(
      id: 4,
      title: "Splash",
      price: 110,
      image: "assets/images/4.png",
      color: Colors.transparent
      ),
];