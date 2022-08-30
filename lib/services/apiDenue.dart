import 'package:http/http.dart' as http;

// https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000001/es/0700/true/BISE/2.0/a5ef31ea-ffe9-3af8-56b1-601f0b48ae7d?type=json
// a5ef31ea-ffe9-3af8-56b1-601f0b48ae7d
// 9cb2abed-dff1-4557-9376-a171ef6e5d09
Future economia() async {
  final response = await http.get(Uri.parse(
      "https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000001/es/0700/true/BISE/2.0/a5ef31ea-ffe9-3af8-56b1-601f0b48ae7d?type=json"));
  // final response = await http.get(Uri.parse(
  //     'https://www.inegi.org.mx/app/api/denue/v1/consulta/Buscar/restaurantes/16.750976903330116, -93.16800871373678/250/9cb2abed-dff1-4557-9376-a171ef6e5d09'));

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    throw Exception("Fallo la conexión");
  }

  return response.body;
}
