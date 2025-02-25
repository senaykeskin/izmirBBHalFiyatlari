import 'package:flutter/material.dart';

import '../global/globalVariables/global_variables.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {

    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      width: W * 0.85,
      height: 60,
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.search, color: Colors.grey[700], size: 30),
          SizedBox(
            width: W * 0.65,
            child: TextField(
              style: searchFont(context, color: Colors.grey[800]),
              cursorColor: Colors.grey,
              maxLength: 40,
              decoration: InputDecoration(
                hintText: "Ürün arayın",
                hintStyle: searchFont(context, color: Colors.grey),
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
