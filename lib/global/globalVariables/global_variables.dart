import 'package:flutter/material.dart';

TextStyle titlesFont13(BuildContext context, {Color? color}) {
  return TextStyle(
      color: color ?? (Colors.black87),
      fontSize: MediaQuery.of(context).size.width / 16,
      fontFamily: "Roboto Slab");
}

TextStyle titleFont15(BuildContext context, {Color? color}) {
  return TextStyle(
      color: color ?? (Colors.black87),
      fontSize: MediaQuery.of(context).size.width / 15,
      fontFamily: "SubTitles");
}

TextStyle searchFont(BuildContext context, {Color? color}) {
  return TextStyle(
      color: color ?? (Colors.black87),
      fontSize: MediaQuery.of(context).size.width / 25,
      fontFamily: "OpenSans");
}

TextStyle productName(BuildContext context, {Color? color}) {
  return TextStyle(
      color: color ?? (Colors.black87),
      fontSize: MediaQuery.of(context).size.width / 34,
      fontFamily: "Product Title");
}

TextStyle seeAll(BuildContext context, {Color? color}) {
  return TextStyle(
      color: color ?? (Colors.purple[700]),
      fontSize: MediaQuery.of(context).size.width / 32,
      fontFamily: "Supplement");
}

