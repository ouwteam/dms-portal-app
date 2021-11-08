import 'package:dms_portal/common/format_date.dart';
import 'package:dms_portal/models/delivery_order.dart';
import 'package:dms_portal/page/action/do_search_page.dart';
import 'package:dms_portal/page/do_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExportStackPage extends StatefulWidget {
  final String title;

  ExportStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _ExportStackPage createState() => _ExportStackPage();
}

class _ExportStackPage extends State<ExportStackPage> {
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
              onPressed: () {
                print("clicked");
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return DoSearchPage(title: "Cari Delivery Order");
                }), (route) => false);
              },
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
