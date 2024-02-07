import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'search for products',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Icon(
                Icons.search,
                color: Color(0xFFedccb3),
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
