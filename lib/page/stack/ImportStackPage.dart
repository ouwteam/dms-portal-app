import 'package:dms_portal/models/down_payment.dart';
import 'package:dms_portal/page/dp_detail_page.dart';
import 'package:flutter/material.dart';

class ImportStackPage extends StatefulWidget {
  final String title;

  ImportStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _ImportStackPage createState() => _ImportStackPage();
}

class _ImportStackPage extends State<ImportStackPage> {
  late FocusNode searchFocusNode;
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text(
    "Import",
    style: TextStyle(color: Colors.black),
  );

  List<DownPayment> orders = [
    DownPayment(
      blNumber: "SITGJTBT7929391",
      consigneeCode: "CSG-001",
      consigneeName: "PT. Bandung Lautan Api",
      containerSize: 20,
      customerCode: "SIT",
      partyQty: 2,
      vesselName: "ACX Diamond",
      voyageNo: "211N",
    ),
    DownPayment(
      blNumber: "SITGJTBT7923910",
      consigneeCode: "CSG-029",
      consigneeName: "PT. Krakatoa Steel",
      containerSize: 20,
      customerCode: "SIT",
      partyQty: 4,
      vesselName: "ACX Diamond",
      voyageNo: "211N",
    ),
  ];

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    searchFocusNode.dispose();
  }

  _ImportStackPage() {
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
          focusNode: searchFocusNode,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );

        searchFocusNode.requestFocus();
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
          title: _appBarTitle,
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: _searchPressed,
              icon: _searchIcon,
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
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: orders.map(
                        (DownPayment downPayment) => ListTile(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return DpDetailPage(title: "Down Payment");
                            }), (route) => false);
                          },
                          tileColor: orders.indexOf(downPayment) % 2 == 0
                              ? Colors.grey[100]
                              : Colors.white,
                          trailing: Icon(Icons.navigate_next),
                          title: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(downPayment.blNumber),
                                SizedBox(height: 5),
                                Text(
                                  downPayment.consigneeName,
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  [downPayment.vesselName, downPayment.voyageNo]
                                      .join(" - "),
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(height: 10),
                                // Row(
                                //   children: [
                                //     Text("1"),
                                //     Text("2"),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ).toList(),
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
