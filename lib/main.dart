import 'package:api_denue/pages/denue.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3 años',
      initialRoute: 'inicio',
      routes: {
        'inicio': (BuildContext context) => const DenueInegi(),
      },
    );
    
  }
}