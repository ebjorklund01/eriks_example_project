import 'package:flutter/material.dart';

class ListDisplayScreen extends StatelessWidget {
  final List<String> entries = const [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  const ListDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Display')),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: entries.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'Entry ${entries[index]}',
          ),
          subtitle: const Text('Subtitle text'),
          leading: const Icon(Icons.account_circle),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
