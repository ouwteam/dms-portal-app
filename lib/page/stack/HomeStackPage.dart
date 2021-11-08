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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
