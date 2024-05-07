import 'package:flutter/material.dart';

class GridLayoutScreen extends StatelessWidget {
  const GridLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid Layout')),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        }),
      ),
    );
  }
}
