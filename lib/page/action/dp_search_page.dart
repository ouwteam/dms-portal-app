import 'package:dms_portal/page/main_page.dart';
import 'package:flutter/material.dart';

class DpSearchPage extends StatefulWidget {
  final String title;

  DpSearchPage({Key? key, required this.title}) : super(key: key);

  @override
  _DpSearchPage createState() => _DpSearchPage();
}

class _DpSearchPage extends State<DpSearchPage> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text(
    "test",
    style: TextStyle(color: Colors.black),
  );

  _DpSearchPage() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        );
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: _appBarTitle,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return MainPage(
                title: "Main Page",
                pIndex: 2,
              );
            }), (route) => false);
          },
        ),
        actions: [
          IconButton(
            onPressed: _searchPressed,
            icon: _searchIcon,
            color: Colors.black,
          )
        ],
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
