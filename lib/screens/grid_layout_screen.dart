import 'package:flutter/material.dart';

class GridLayoutScreen extends StatelessWidget {
  const GridLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid Layout')),
      body: GridView.builder(
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
