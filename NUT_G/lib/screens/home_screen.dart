import 'package:flutter/material.dart';
import 'package:nut_g/screens/widgets/banner_widget.dart';
import 'package:nut_g/screens/widgets/category.dart';
import 'package:nut_g/screens/widgets/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'NUT G BASE',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          )),
          SearchInput(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BannerWidget(),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: categoryScreen(),
          )
        ],
      ),
    );
  }
}
