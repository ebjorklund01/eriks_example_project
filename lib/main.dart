import 'package:eriks_example_project/screens/basic_layout_screen.dart';
import 'package:eriks_example_project/screens/counter_screen.dart';
import 'package:eriks_example_project/screens/grid_layout_screen.dart';
import 'package:eriks_example_project/screens/list_display_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Basic Layout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicLayoutScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('List Display'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListDisplayScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Grid Layout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GridLayoutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
