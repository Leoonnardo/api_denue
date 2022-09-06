import 'package:api_denue/services/apiDenue.dart';
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
        leading: const Icon(Icons.arrow_back),
        title: const Text('Comercios'),
      ),
      body: Container(
          color: Colors.transparent,
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
                            size.width,
                            tradeData[index]['CLEE'].toString(),
                            tradeData[index]['Id'],
                            tradeData[index]['Nombre']),
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

  Widget cardDenue(double width, String clee, String id, String nombre) {
    return Card(
      color: Colors.grey,
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: ListTile(
              title: Text(
                nombre,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text('$clee || $id'),
              // trailing: TextButton(
              //     child: const Text('Comprar',
              //         style: TextStyle(fontSize: 15, color: Colors.green)),
              //     style: ElevatedButton.styleFrom(
              //       side: const BorderSide(width: 2, color: Colors.green),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //     ),
              //     onPressed: () {
              //       Map<String, dynamic> restaurant = {
              //         'id': idRestaurant.toString(),
              //         'name': nameRestaurant
              //       };
              //       Navigator.pushNamed(context, 'restaurantMenu', arguments: {
              //         'user': user,
              //         'restaurant': restaurant,
              //         'order': order,
              //       });
              //     }),
            ),
          ),
        ],
      ),
    );
  }
}
