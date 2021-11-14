import 'package:dms_portal/page/main_page.dart';
import 'package:flutter/material.dart';

class DpSearchPage extends StatefulWidget {
  final String title;

  DpSearchPage({Key? key, required this.title}) : super(key: key);

  @override
  _DpSearchPage createState() => _DpSearchPage();
}

class _DpSearchPage extends State<DpSearchPage> {
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
            Text("Search Page"),
          ],
        ),
      ),
    );
  }
}
