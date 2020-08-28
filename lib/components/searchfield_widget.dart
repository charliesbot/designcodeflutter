import 'package:flutter/material.dart';
import 'package:hume/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 33),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16,
              )
            ],
          ),
          child: TextField(
            cursorColor: kPrimaryLabelColor,
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: kPrimaryLabelColor,
                size: 20,
              ),
              border: InputBorder.none,
              hintText: "Search for courses",
              hintStyle: kSearchPlaceholderStyle,
            ),
            style: kSearchTextStyle,
            onChanged: (newText) {
              print(newText);
            },
          ),
        ),
      ),
    );
  }
}
