import 'package:dms_portal/page/login_page.dart';
import 'package:flutter/material.dart';

class AkunStackPage extends StatefulWidget {
  final String title;

  AkunStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _AkunStackPage createState() => _AkunStackPage();
}

class _AkunStackPage extends State<AkunStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 2,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Column(
                children: ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    title: Text("Profile"),
                    trailing: Icon(Icons.person_outline_outlined),
                  ),
                  ListTile(
                    title: Text("Settings"),
                    trailing: Icon(Icons.settings_outlined),
                  ),
                  ListTile(
                    title: Text("Data Source"),
                    trailing: Icon(Icons.source_outlined),
                  ),
                  ListTile(
                    title: Text("Logout"),
                    trailing: Icon(Icons.settings_power_rounded),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("See you soon :)")));
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage(title: "Login Page");
                      }), (route) => false);
                    },
                  ),
                ]).toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
