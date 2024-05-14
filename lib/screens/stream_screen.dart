import 'dart:async';
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  StreamScreenState createState() => StreamScreenState();
}

class StreamScreenState extends State<StreamScreen> {
  late StreamController<int> _streamController;
  late Stream<int> _numberStream;
  Timer? _timer;
  int _currentNumber = 0;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
    _numberStream = _streamController.stream;
  }

  void _startNumberStream() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _streamController.add(_currentNumber++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _numberStream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text('Awaiting numbers...');
                }
                return Text('Number: ${snapshot.data}');
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _startNumberStream,
              child: Text('Start Streaming Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}
