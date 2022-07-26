import 'package:flutter/material.dart';
import 'package:responsiveui/bodyUi.dart';
import 'package:responsiveui/drawerUi.dart';
import 'package:responsiveui/favoriteUi.dart';
import 'package:responsiveui/profileUi.dart';

class FirstPage extends StatefulWidget {
  Function changeTheme;
  bool isDark;
  FirstPage(this.isDark, this.changeTheme);
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  var size, height, width;
  int index = 0;
  String page = 'Home';

  changeContentFromDrawer(int i) {
    index = i;
    if (i == 0) {
      page = 'Home';
    } else if (i == 1) {
      page = 'Favourite';
    } else {
      page = 'Profile';
    }
    setState(() {});
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer'),
          bottom: const TabBar(tabs: [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.person),
          ]),
        ),
        body: (orientation == Orientation.landscape)
            ? Center(
                child: TabBarView(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: width / 2,
                          height: height,
                          child: SingleChildScrollView(
                            child: DrawerState(changeContentFromDrawer),
                          )),
                      SizedBox(
                          width: width / 2,
                          height: height,
                          child: SingleChildScrollView(
                              child: BodyUi(
                                  page, widget.isDark, widget.changeTheme)))
                    ],
                  ),
                  FavoriteUi(),
                  ProfileUi()
                ],
              ))
            : Center(
                child: TabBarView(
                children: [
                  BodyUi(page, widget.isDark, widget.changeTheme),
                  FavoriteUi(),
                  ProfileUi()
                ],
              )),
        drawer: (orientation == Orientation.landscape)
            ? null
            : Drawer(
                child: DrawerState(changeContentFromDrawer),
              ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (i) {
              if (i == 1) {
                index = 1;
                page = 'Favorite';
              } else if (i == 2) {
                index = 2;
                page = 'Profile';
              } else {
                index = 0;
                page = 'Home';
              }
              setState(() {});
            },
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ]),
      ),
    );
  }
}
