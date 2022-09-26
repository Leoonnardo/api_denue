import 'package:api_denue/widgets/controller_map.dart';
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

  var listaEconomia = ["Restaurantes", "Hoteles", "Camiones", "Pesca"];
  var listaDistancia = ["300", "500", "1000"];
  String seccionDistancia = "Distancia";
  String seccionEconomia = "Economia";
  final codPostal = TextEditingController();
  int noPostal = 0;

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(16.755841143621865, -93.12323672443239),
    zoom: 14.4746,
  );

  late LatLng latitud = const LatLng(0, 0);
  bool botonBuscar = false;
  bool botonEconomia = false;
  bool botonDistancia = false;
  bool clickUbicacion = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<ControllerMap>(
      create: (_) => ControllerMap(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Denue'),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  SizedBox(
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
                                botonEconomia = true;
                                if (clickUbicacion == true &&
                                    botonDistancia == true &&
                                    botonEconomia == true) {
                                  botonBuscar = true;
                                }
                              });
                            }),
                            hint: Text(seccionEconomia),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
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
                                botonDistancia = true;
                                if (clickUbicacion == true &&
                                    botonDistancia == true &&
                                    botonEconomia == true) {
                                  botonBuscar = true;
                                }
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
                  onTap: (argument) {
                    latitud = controller.onTap(argument);
                    clickUbicacion = true;
                    setState(() {});
                    if (clickUbicacion == true &&
                        botonDistancia == true &&
                        botonEconomia == true) {
                      botonBuscar = true;
                    }
                  },
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
                      onPressed: botonBuscar
                          ? () {
                              print("Economia: " + seccionEconomia);
                              print("Distancia: " + seccionDistancia);
                              print("Latitud: " +
                                  latitud.latitude.toString() +
                                  " " +
                                  latitud.longitude.toString());
                              print("Latitud: " + latitud.toString());
                              if (seccionEconomia != "Economia" &&
                                  seccionDistancia != "Distancia" &&
                                  latitud.latitude.toString() != "0.0" &&
                                  latitud.longitude.toString() != "0.0") {
                                print("Es correcto");
                                Navigator.pushReplacementNamed(
                                    context, 'listDenue',
                                    arguments: {
                                      'data': [
                                        seccionEconomia,
                                        latitud.latitude.toString(),
                                        latitud.longitude.toString(),
                                        seccionDistancia
                                      ]
                                    });
                              } else {
                                print("No has elegido uno");
                              }
                              //
                            }
                          : null,
                      child: const Text('Buscar'))),
            )
          ],
        ),
      ),
    );
  }
}
