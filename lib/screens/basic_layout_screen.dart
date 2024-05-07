import 'package:flutter/material.dart';

class BasicLayoutScreen extends StatelessWidget {
  const BasicLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Layout')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Container(color: Colors.red, height: 100)),
                Expanded(child: Container(color: Colors.green, height: 100)),
              ],
            ),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
            Container(color: Colors.blue, height: 100),
          ],
        ),
      ),
    );
  }
}
