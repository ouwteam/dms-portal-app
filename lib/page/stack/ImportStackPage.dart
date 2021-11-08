import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImportStackPage extends StatefulWidget {
  final String title;

  ImportStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _ImportStackPage createState() => _ImportStackPage();
}

class _ImportStackPage extends State<ImportStackPage> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notify) {
        if (notify is ScrollEndNotification) {
          print("new page vrohh");
        }

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
          elevation: 2,
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: Stack(
            children: [
              Column(
                children: [
                  Column(
                    children: ListTile.divideTiles(context: context, tiles: [
                      ListTile(
                        title: Text("Profile"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ]).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
