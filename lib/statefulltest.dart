import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return screenState();
  }
}

class screenState extends State<screen> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("State Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  (color == Colors.white)
                      ? color = Colors.greenAccent
                      : color = Colors.white;
                  setState(() {});
                },
                child: const Text("Change Background Color"))
          ],
        ),
      ),
    );
  }
}
