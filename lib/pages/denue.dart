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
  String seccion = "Selec. Economia";
  final codPostal = TextEditingController();
  int noPostal = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Denue'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'listDenue', arguments: {
            'data': [
              'comercio',
              '16.2320885648689',
              '-93.90821390642238',
              '250'
            ]
          });
          // print('DATA');
          // getEconomia(
          //     'comercio', '16.2320885648689', '-93.90821390642238', '250');
        },
        child: const Icon(Icons.info_outline),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: null,
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              width: size.width,
              height: size.height * 0.1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // color: Colors.blue,
                    width: size.width * 0.3,
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: codPostal,
                      autofocus: false,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Cod. Postal',
                        // enabledBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.black)),
                        // focusedBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.black))
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.pink,
                    width: size.width * 0.4,
                    padding: const EdgeInsets.all(5),
                    child: DropdownButton(
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: size.width * 0.2,
                      // padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                          onPressed: () {
                            noPostal = int.parse(codPostal.text);
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                          'Codigo postal: $noPostal y Seleccion de economia: $seccion'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'))
                                      ],
                                    ));
                            print(noPostal);
                          },
                          child: const Text('Buscar')))
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
