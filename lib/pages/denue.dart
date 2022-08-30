import 'package:api_denue/services/apiDenue.dart';
import 'package:flutter/material.dart';

class DenueInegi extends StatefulWidget {
  const DenueInegi({super.key});

  @override
  State<DenueInegi> createState() => _DenueInegiState();
}

class _DenueInegiState extends State<DenueInegi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Denue'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('DATA');
          economia();
        },
        child: const Icon(Icons.info_outline),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: null,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              color: Colors.grey,
              child: Row(
                children: const [Text('LAT'), Text('LONG')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
