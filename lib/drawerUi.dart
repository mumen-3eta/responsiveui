import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerState extends StatefulWidget {
  Function change;
  DrawerState(this.change);
  @override
  State<StatefulWidget> createState() {
    return DrawerUi();
  }
}

class DrawerUi extends State<DrawerState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Mumen'),
          accountEmail: Text('mumen.3eta@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: Text(
              'M',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          trailing: const Icon(Icons.arrow_forward_ios),
          subtitle: const Text('Go Home'),
          title: const Text('Home'),
          onTap: () => widget.change(0),
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          trailing: const Icon(Icons.arrow_forward_ios),
          subtitle: const Text('Go to Favirate'),
          title: const Text('Favirate'),
          onTap: () => widget.change(1),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.arrow_forward_ios),
          subtitle: const Text('Go to Profile'),
          title: const Text('Profile'),
          onTap: () {
            widget.change(2);
          },
        )
      ],
    );
  }
}
