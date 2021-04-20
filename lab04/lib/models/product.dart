import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class Product {
  final String image, title, description;
  final int price, id;
  final Color color;

  Product({
    this.id,
    this.image,
    this.title,
    this.description,
    this.price,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      image: "assets/images/1.png",
      title: 'Samurai',
      description: lipsum.createParagraph(numSentences: 2, numParagraphs: 2),
      price: 119,
      color: greenColor),
  Product(
      id: 2,
      image: "assets/images/2.png",
      title: "Blue Wave",
      description: lipsum.createParagraph(numSentences: 4),
      price: 119,
      color: Colors.transparent),
  Product(
      id: 3,
      image: "assets/images/3.png",
      title: "Amer Fly",
      description: lipsum.createParagraph(numSentences: 3, numParagraphs: 2),
      price: 150,
      color: Colors.transparent),
  Product(
      id: 4,
      image: "assets/images/4.png",
      title: "Splash",
      description: lipsum.createParagraph(numSentences: 4, numParagraphs: 3),
      price: 110,
      color: Colors.transparent),
];
