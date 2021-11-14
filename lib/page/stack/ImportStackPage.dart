import 'package:dms_portal/models/down_payment.dart';
import 'package:dms_portal/page/action/dp_search_page.dart';
import 'package:dms_portal/page/dp_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImportStackPage extends StatefulWidget {
  final String title;

  ImportStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _ImportStackPage createState() => _ImportStackPage();
}

class _ImportStackPage extends State<ImportStackPage> {
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
                  return DpSearchPage(title: "Cari Delivery Order");
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
