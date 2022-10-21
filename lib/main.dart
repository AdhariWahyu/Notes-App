import 'package:belajar4/providers/notes.dart';
import 'package:belajar4/screens/add_or_detail_screen.dart';
import 'package:belajar4/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => Notes()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: HomeScreen(),
        routes: {
          AddOrDetailScreen.routeName: (context) => AddOrDetailScreen(),
        },
      ),
    );
  }
}
