import 'package:dms_portal/common/snack_alert.dart';
import 'package:dms_portal/models/data_source.dart';
import 'package:dms_portal/page/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String _username = "";
  String _password = "";
  DataSource? _selectedApi;

  List<DataSource> dataSources = [
    DataSource(
      id: 1,
      apiCode: "JKT",
      apiName: "Depo Jakarta",
      apiAddr: "",
      apiKey: "",
    ),
    DataSource(
      id: 2,
      apiCode: "SBY",
      apiName: "Depo Surabaya",
      apiAddr: "",
      apiKey: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 66),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _username = value;
                    });
                  },
                ),
                SizedBox(height: 24),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 24),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Data Source?",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Column(
                  children: dataSources
                      .map((e) => RadioListTile<DataSource>(
                            title: Text(e.apiName),
                            value: e,
                            groupValue: _selectedApi,
                            onChanged: (value) {
                              setState(() {
                                _selectedApi = value;
                              });
                            },
                          ))
                      .toList(),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Lupa password?"),
                    Container(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_username == "") {
                            snackAlert(
                              context,
                              "Username is required",
                              AlertType.error,
                            );
                            return;
                          }

                          if (_selectedApi == null) {
                            snackAlert(
                              context,
                              "Data source is required",
                              AlertType.error,
                            );
                            return;
                          }

                          snackAlert(
                            context,
                            "Welcome $_username with source ${_selectedApi?.apiName}",
                            AlertType.info,
                          );
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return MainPage(title: "Main Page");
                          }), (route) => false);
                        },
                        child: Row(
                          children: [
                            Text("Login"),
                            SizedBox(width: 5),
                            Transform.rotate(
                              angle: math.pi / 1,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
