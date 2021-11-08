import 'package:dms_portal/page/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoSearchPage extends StatefulWidget {
  final String title;

  DoSearchPage({Key? key, required this.title}) : super(key: key);

  @override
  _DoSearchPage createState() => _DoSearchPage();
}

class _DoSearchPage extends State<DoSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("DO Search Page"),
          ],
        ),
      ),
    );
  }
}
