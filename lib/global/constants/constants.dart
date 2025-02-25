import 'package:flutter/material.dart';

double W(BuildContext context) => MediaQuery.of(context).size.width;

double H(BuildContext context) => MediaQuery.of(context).size.height;

final imageBaseUrl = "https://www.bizizmir.com/YuklenenDosyalar/Hal//";

const cardBackgroundColor = Colors.white;

BorderRadius circularRadius(double value) => BorderRadius.circular(value);

EdgeInsets paddingAll(double value) => EdgeInsets.all(value);
EdgeInsets paddingTop(double value) => EdgeInsets.only(top: value);
EdgeInsets paddingHorizontal(double value) => EdgeInsets.symmetric(horizontal: 10);

class GeneralStrings {
  static const String serviceError = "Veri alınamadı";
  static const String categories = "Kategoriler";
  static const String fishes = "Balıklar";
  static const String fruits = "Meyveler";
  static const String vegetables = "Sebzeler";
  static const String vegetable = "SEBZE";
  static const String fruit = "MEYVE";
  static const String seeAll = "Tümünü gör \u2794";
}
