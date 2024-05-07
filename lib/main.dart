import 'package:eriks_example_project/screens/basic_layout_screen.dart';
import 'package:eriks_example_project/screens/counter_screen.dart';
import 'package:eriks_example_project/screens/form_input_screen.dart';
import 'package:eriks_example_project/screens/grid_layout_screen.dart';
import 'package:eriks_example_project/screens/list_display_screen.dart';
import 'package:eriks_example_project/screens/sliver_screen.dart';
import 'package:eriks_example_project/cubits/counter_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
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
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: const CounterButtons(),
      body: ListView(
        children: <Widget>[
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return ListTile(
                title: Text(state.toString()),
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
            title: const Text('Sliver Demo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SliverScreen()),
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
            title: const Text('Form Input'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FormInputScreen()),
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
