import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  const ScreenSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 745, // iphone 14 (tested on my phone)
        width: 393, // iphone 14?
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
            Text("The red lines are the aprox. size of an iphone 14"),
          ],
        ),
      ),
    );
  }
}
