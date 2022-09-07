import 'package:api_denue/styles/colors_views.dart';
import 'package:flutter/material.dart';

class TradeData extends StatefulWidget {
  const TradeData({Key? key}) : super(key: key);

  @override
  State<TradeData> createState() => _TradeDataState();
}

class _TradeDataState extends State<TradeData> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final dataComercio = arguments['dataComercio'];
    final dataConsulta = arguments['dataConsulta'];
    print(dataConsulta[0]);
    print(dataConsulta[1]);
    print(dataConsulta[2]);
    print(dataConsulta[3]);
    // CLEE:
    // Id:
    // Nombre:
    // Razon_social:
    // Clase_actividad:
    // Estrato:
    // Tipo_vialidad:
    // Calle:
    // Num_Exterior:
    // Num_Interior:
    // Colonia:
    // CP:
    // Ubicacion:
    // Telefono:
    // Correo_e:
    // Sitio_internet:
    // Tipo:
    // Longitud:
    // Latitud:
    // CentroComercial:
    // TipoCentroComercial:
    // NumLocal:

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'listDenue', arguments: {
                'data': [
                  dataConsulta[0],
                  dataConsulta[1],
                  dataConsulta[2],
                  dataConsulta[3],
                ]
              });
            },
          ),
          title: const Text('Datos del comercio'),
        ),
        body: Container(
          color: ColorSelect.container,
          width: size.width,
          height: double.infinity,
          child: ListView(
            children: [
              ListTile(
                title: const Text('CLEE:'),
                subtitle: Text(dataComercio['CLEE']),
              ),
              ListTile(
                title: const Text('Id:'),
                subtitle: Text(dataComercio['Id']),
              ),
              ListTile(
                title: const Text('Nombre:'),
                subtitle: Text(dataComercio['Nombre']),
              ),
              ListTile(
                title: const Text('Razon social:'),
                subtitle: Text(dataComercio['Razon_social']),
              ),
              ListTile(
                title: const Text('Clase actividad:'),
                subtitle: Text(dataComercio['Clase_actividad']),
              ),
              ListTile(
                  title: const Text('Estrato:'),
                  subtitle: Text(dataComercio['Estrato'])),
              ListTile(
                title: const Text('Tipo vialidad:'),
                subtitle: Text(dataComercio['Tipo_vialidad']),
              ),
              ListTile(
                title: const Text('Calle:'),
                subtitle: Text(dataComercio['Calle']),
              ),
              ListTile(
                title: const Text('Num Exterior:'),
                subtitle: Text(dataComercio['Num_Exterior']),
              ),
              ListTile(
                title: const Text('Num Interior:'),
                subtitle: Text(dataComercio['Num_Interior']),
              ),
              ListTile(
                title: const Text('Colonia:'),
                subtitle: Text(dataComercio['Colonia']),
              ),
              ListTile(
                title: const Text('CP:'),
                subtitle: Text(dataComercio['CP']),
              ),
              ListTile(
                title: const Text('Ubicacion:'),
                subtitle: Text(dataComercio['Ubicacion']),
              ),
              ListTile(
                title: const Text('Telefono:'),
                subtitle: Text(dataComercio['Telefono']),
              ),
              ListTile(
                title: const Text('Correo electronico:'),
                subtitle: Text(dataComercio['Correo_e']),
              ),
              ListTile(
                title: const Text('Sitio de internet:'),
                subtitle: Text(dataComercio['Sitio_internet']),
              ),
              ListTile(
                title: const Text('Tipo:'),
                subtitle: Text(dataComercio['Tipo']),
              ),
              ListTile(
                title: const Text('Longitud:'),
                subtitle: Text(dataComercio['Longitud']),
              ),
              ListTile(
                title: const Text('Latitud:'),
                subtitle: Text(dataComercio['Latitud']),
              ),
              ListTile(
                title: const Text('Centro Comercial:'),
                subtitle: Text(dataComercio['CentroComercial']),
              ),
              ListTile(
                title: const Text('Tipo de Centro Comercial:'),
                subtitle: Text(dataComercio['TipoCentroComercial']),
              ),
              ListTile(
                title: const Text('Numero de Local:'),
                subtitle: Text(dataComercio['NumLocal']),
              ),
            ],
          ),
          // child: ListView.builder(
          //   itemCount: arguments.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text('Hola $index'),
          //       subtitle: const Text('Bienvenido'),
          //     );
          //   },
          // ),
        ));
  }
}
