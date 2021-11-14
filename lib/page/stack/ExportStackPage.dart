import 'package:dms_portal/common/format_date.dart';
import 'package:dms_portal/models/delivery_order.dart';
import 'package:dms_portal/page/action/do_search_page.dart';
import 'package:dms_portal/page/do_detail_page.dart';
import 'package:flutter/material.dart';

class ExportStackPage extends StatefulWidget {
  final String title;

  ExportStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _ExportStackPage createState() => _ExportStackPage();
}

class _ExportStackPage extends State<ExportStackPage> {
  late FocusNode searchFocusNode;
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text(
    "Export",
    style: TextStyle(color: Colors.black),
  );

  @override
  void initState() {
    super.initState();

    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    searchFocusNode.dispose();

    super.dispose();
  }

  List<DeliveryOrder> orders = [
    DeliveryOrder(
      doNumber: "TGHU84719221",
      consigneeName: "PT. Bandung Pekasa Jaya",
      etd: "2022-12-30",
    ),
    DeliveryOrder(
      doNumber: "TEMU84719331",
      consigneeName: "PT. Nabati Indonesia",
      etd: "2022-12-30",
    ),
    DeliveryOrder(
      doNumber: "SITU84719331",
      consigneeName: "PT. Nabati Indonesia",
      etd: "2022-12-30",
    ),
    DeliveryOrder(
      doNumber: "TGHU84719331",
      consigneeName: "PT. Nabati Indonesia",
      etd: "2022-12-30",
    ),
  ];

  _ExportStackPage() {
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
                        (DeliveryOrder deliveryOrder) => ListTile(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return DoDetailPage(title: "Delivery Order");
                            }), (route) => false);
                          },
                          tileColor: orders.indexOf(deliveryOrder) % 2 == 0
                              ? Colors.grey[100]
                              : Colors.white,
                          trailing: Icon(Icons.navigate_next),
                          title: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(deliveryOrder.doNumber),
                                SizedBox(height: 5),
                                Text(
                                  deliveryOrder.consigneeName,
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  formatDate(deliveryOrder.etd, "d MMM y"),
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
