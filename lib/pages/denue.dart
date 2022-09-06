import 'package:api_denue/services/apiDenue.dart';
import 'package:api_denue/widgets/recetaSeleccionada.dart';
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

  var lista = ["Economia1", "Economia2", "Economia3"];
  String seccion = "Selecion de economia";

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
              // child: Row(
              //   children: const [Text('LAT'), Text('LONG')],
              // ),
              child: Row(
                children: [
                  DropdownButton(
                    items: lista.map((String resultado) {
                      return DropdownMenuItem(
                          value: resultado, child: Text(resultado));
                    }).toList(),
                    onChanged: ((value) {
                      setState(() {
                        seccion = value.toString();
                      });
                    }),
                    hint: Text(seccion),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) => InkWell(
                  child: const RecetaSeleccionada(
                      prueba1: "colorCaducidad", prueba2: "Color asda"),
                  onTap: () {
                    print("Se esta tocando");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
