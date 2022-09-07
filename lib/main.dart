import 'package:api_denue/pages/denue.dart';
import 'package:api_denue/pages/listViewDenue.dart';
import 'package:api_denue/pages/tradeData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inegi Denue',
      initialRoute: 'inicio',
      routes: {
        'inicio': (_) => const DenueInegi(),
        'listDenue': (_) => const ListViewDenue(),
        'tradeData': (_) => const TradeData(),
      },
    );
  }
}
