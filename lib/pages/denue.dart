import 'dart:async';

import 'package:api_denue/services/apiDenue.dart';
import 'package:api_denue/widgets/controller_map.dart';
import 'package:api_denue/widgets/recetaSeleccionada.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  // Completer<GoogleMapController> _controller = Completer();
  // final _controller = ControllerMap();

  var listaEconomia = ["Restaurantes", "Hoteles", "Camiones", "Pesca"];
  var listaDistancia = ["300 m", "500 m", "1000 m"];
  String seccionDistancia = "Distancia";
  String seccionEconomia = "Economia";
  final codPostal = TextEditingController();
  int noPostal = 0;

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(16.755841143621865, -93.12323672443239),
    zoom: 14.4746,
  );

  final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<ControllerMap>(
      create: (_) => ControllerMap(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Denue'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('DATA');
            // economia();
          },
          child: const Icon(Icons.info_outline),
        ),
        // body: GoogleMap(
        //   mapType: MapType.normal,
        //   initialCameraPosition: _kGooglePlex,
        //   onMapCreated: (GoogleMapController controller) {
        //     _controller.complete(controller);
        //   },
        // ),
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.red,
                    width: size.width,
                    height: size.height * 0.1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          // color: Colors.pink,
                          width: size.width * 0.4,
                          padding: const EdgeInsets.all(5),
                          child: DropdownButton(
                            items: listaEconomia.map((String resultado) {
                              return DropdownMenuItem(
                                  value: resultado, child: Text(resultado));
                            }).toList(),
                            onChanged: ((value) {
                              setState(() {
                                seccionEconomia = value.toString();
                              });
                            }),
                            hint: Text(seccionEconomia),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          // color: Colors.pink,
                          width: size.width * 0.4,
                          padding: const EdgeInsets.all(5),
                          child: DropdownButton(
                            items: listaDistancia.map((String resultado) {
                              return DropdownMenuItem(
                                  value: resultado, child: Text(resultado));
                            }).toList(),
                            onChanged: ((value) {
                              setState(() {
                                seccionDistancia = value.toString();
                              });
                            }),
                            hint: Text(seccionDistancia),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: size.height * 0.1),
              width: size.width,
              height: size.height * 0.7,
              child: Consumer<ControllerMap>(
                builder: (_, controller, __) => GoogleMap(
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: controller.onMapCreated,
                  markers: controller.markers,
                  onTap: controller.onTap,
                ),
              ),
            ),
            Center(
              child: Container(
                  // color: Colors.pink,
                  margin: EdgeInsets.only(top: size.height * 0.6),
                  height: size.height * 0.05,
                  width: size.width * 0.4,
                  // padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Buscar'))),
            )
          ],

          // SizedBox(
          //   height: size.height * 0.5,
          //   child: ListView.builder(
          //     itemCount: 5,
          //     itemBuilder: (_, index) => InkWell(
          //       child: const RecetaSeleccionada(
          //           prueba1: "colorCaducidad", prueba2: "Color asda"),
          //       onTap: () {
          //         print("Se esta tocando");
          //       },
          //     ),
          //   ),
          // )
        ),
      ),
    );
  }
}
