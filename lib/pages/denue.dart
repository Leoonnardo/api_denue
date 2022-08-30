import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DenueInegi extends StatefulWidget {
  const DenueInegi({super.key});

  @override
  State<DenueInegi> createState() => _DenueInegiState();
}

class _DenueInegiState extends State<DenueInegi> {
  //https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000001/es/0700/true/BISE/2.0/a5ef31ea-ffe9-3af8-56b1-601f0b48ae7d?type=json
  //a5ef31ea-ffe9-3af8-56b1-601f0b48ae7d
  Future _economia() async {
    final response = await http.get(Uri.parse(
        "https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000001/es/0700/true/BISE/2.0/a5ef31ea-ffe9-3af8-56b1-601f0b48ae7d?type=json"));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("Fallo la conexión");
    }

    return response.body;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _economia();
  }

  @override
  Widget build(BuildContext context) {
    dynamic ver;
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.amber,
          child: Column(
            children: [
              ListTile(
                onTap: (() {
                  ver = _economia();
                  Center(
                    child: Text(ver.toString()),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
