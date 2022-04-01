import 'package:flutter/material.dart';
import 'package:flutter_google_map/ui/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff22577E),
      ),
      home: const SearchScreen(),
    );
  }
}
