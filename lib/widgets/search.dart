import 'package:flutter/material.dart';
import '../global/constants/constants.dart';
import '../global/globalVariables/global_variables.dart';

class SearchComponent extends StatefulWidget {
  final Function(String) onSearchChanged;

  const SearchComponent({super.key, required this.onSearchChanged});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: circularRadius(20),
        color: Colors.grey[300],
      ),
      width: W(context),
      height: 60,
      margin: paddingTop(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.search, color: Colors.grey[700], size: 30),
          SizedBox(
            width: W(context) * 0.70,
            child: TextField(
              controller: _controller,
              style: searchFont(context, color: Colors.grey[800]),
              cursorColor: Colors.grey,
              maxLength: 40,
              decoration: InputDecoration(
                hintText: "Ürün Ara...",
                hintStyle: searchFont(context, color: Colors.grey),
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: (query) {
                widget.onSearchChanged(query);
              },
            ),
          ),
        ],
      ),
    );
  }
}
