import 'package:dms_portal/page/stack/AkunStackPage.dart';
import 'package:dms_portal/page/stack/ExportStackPage.dart';
import 'package:dms_portal/page/stack/HomeStackPage.dart';
import 'package:dms_portal/page/stack/ImportStackPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;
  final int pIndex;

  MainPage({
    Key? key,
    required this.title,
    this.pIndex = 0,
  }) : super(key: key);

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  late PageController pageController;
  int bottomNavBarIndex = 0;

  @override
  void initState() {
    bottomNavBarIndex = widget.pIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
                pageController.jumpToPage(index);
              });
            },
            children: [
              HomeStackPage(title: "Home"),
              ExportStackPage(title: "Export"),
              ImportStackPage(title: "Import"),
              AkunStackPage(title: "My Account"),
            ],
          ),
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 1,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[500],
          showUnselectedLabels: true,
          currentIndex: bottomNavBarIndex,
          onTap: (index) {
            setState(() {
              bottomNavBarIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: bottomNavBarIndex == 0 ? Colors.blue : Colors.grey[500],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.upload_outlined,
                color: bottomNavBarIndex == 1 ? Colors.blue : Colors.grey[500],
              ),
              label: 'Export',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.download_outlined,
                color: bottomNavBarIndex == 2 ? Colors.blue : Colors.grey[500],
              ),
              label: 'Import',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: bottomNavBarIndex == 3 ? Colors.blue : Colors.grey[500],
              ),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}
