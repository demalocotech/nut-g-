import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class categoryScreen extends StatefulWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: ActionChip(
                backgroundColor: Color(0xFFedccb3),
                onPressed: () {
                  setState(() {});
                },
                label: Center(
                    child: Text(
                  'CATEGORY',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
              ),
            );
          }),
    );
  }
}
