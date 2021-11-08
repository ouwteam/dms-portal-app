import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeStackPage extends StatefulWidget {
  final String title;

  HomeStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _HomeStackPage createState() => _HomeStackPage();
}

class _HomeStackPage extends State<HomeStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
          ],
        ),
      ),
    );
  }
}
