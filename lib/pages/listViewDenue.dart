import 'package:api_denue/services/apiDenue.dart';
import 'package:api_denue/styles/colors_views.dart';
import 'package:flutter/material.dart';

class ListViewDenue extends StatefulWidget {
  const ListViewDenue({Key? key}) : super(key: key);

  @override
  State<ListViewDenue> createState() => _ListViewDenueState();
}

class _ListViewDenueState extends State<ListViewDenue> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final dataConsulta = arguments['data'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'inicio');
          },
        ),
        title: const Text('Comercios'),
      ),
      body: Container(
          color: ColorSelect.container,
          width: size.width,
          height: double.infinity,
          child: FutureBuilder(
            initialData: const [],
            future: getEconomia(dataConsulta[0], dataConsulta[1],
                dataConsulta[2], dataConsulta[3]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('Waiting for connection');
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  print('There is no data');
                  return const Center(child: CircularProgressIndicator());
                } else {
                  List tradeData = snapshot.data;
                  return RefreshIndicator(
                      // child: const Text('WELCOME LIST'),
                      child: ListView.builder(
                        itemCount: tradeData.length,
                        itemBuilder: (context, index) => cardDenue(
                            size.width, tradeData[index], dataConsulta),
                      ),
                      onRefresh: () async {
                        setState(() {});
                      });
                }
              }
            },
          )),
    );
  }

  // String clee, String id, String nombre
  Widget cardDenue(double width, Map dataComercio, List dataConsulta) {
    return Card(
      color: ColorSelect.card,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: ListTile(
              title: Text(
                dataComercio['Nombre'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(dataComercio['Telefono'],
                  style: const TextStyle(fontSize: 15)),
              trailing: TextButton(
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: ColorSelect.button,
                    // side: const BorderSide(width: 2, color: ColorSelect.button),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Ver',
                      style: TextStyle(fontSize: 15, color: ColorSelect.text)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'tradeData',
                        arguments: {
                          'dataConsulta': dataConsulta,
                          'dataComercio': dataComercio
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
