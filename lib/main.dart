import 'package:eriks_example_project/cubits/counter_cubit.dart';
import 'package:eriks_example_project/screens/basic_layout_screen.dart';
import 'package:eriks_example_project/screens/counter_screen.dart';
import 'package:eriks_example_project/screens/gemini_chat_screen.dart';
import 'package:eriks_example_project/screens/grid_layout_screen.dart';
import 'package:eriks_example_project/screens/list_display_screen.dart';
import 'package:eriks_example_project/screens/stream_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY']!);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterValue = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(title: Text('Home $counterValue')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Gemini Chat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GeminiChatScreen()),
              );
            },
          ),
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
            title: const Text('Stream'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StreamScreen()),
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
