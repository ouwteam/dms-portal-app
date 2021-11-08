import 'package:dms_portal/page/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoDetailPage extends StatefulWidget {
  final String title;

  DoDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  _DoDetailPage createState() => _DoDetailPage();
}

class _DoDetailPage extends State<DoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Delivery Order"),
              Tab(text: "Party"),
              Tab(text: "Release"),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return MainPage(
                  title: "Main Page",
                  pIndex: 1,
                );
              }), (route) => false);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 2,
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
