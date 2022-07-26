import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyUi extends StatelessWidget {
  String page;
  bool isDark;
  Function changeTheme;
  BodyUi(this.page, this.isDark, this.changeTheme);
  @override
  Widget build(BuildContext context) {
    bool landScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  child: Image.asset('assets/images/fun.jpg',
                      width: landScape
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2),
                ),
                const Text('image1', style: TextStyle(fontSize: 20))
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: Image.asset('assets/images/fun.jpg',
                      width: landScape
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2),
                ),
                const Text('image2', style: TextStyle(fontSize: 20)),
              ],
            )
          ],
        ),
        Text(page,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(isDark ? 'ON' : 'OFF'),
            Switch(
                value: isDark,
                onChanged: (value) {
                  changeTheme(value);
                })
          ],
        )
      ],
    );
  }
}
