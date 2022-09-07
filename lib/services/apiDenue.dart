import 'dart:convert';
import 'package:http/http.dart' as http;

// 9cb2abed-dff1-4557-9376-a171ef6e5d09
Future<List<dynamic>> getEconomia(
    String condicion, String lat, String long, String distancia) async {
  String clave = '9cb2abed-dff1-4557-9376-a171ef6e5d09';
  try {
    final response = await http.get(
        Uri.parse(
            'https://www.inegi.org.mx/app/api/denue/v1/consulta/Buscar/$condicion/$lat,%20$long/$distancia/$clave'),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      print('DENTRO DEL JSON');
      // print(jsonResponse[3]);
      // print(jsonResponse);
      return jsonResponse;
      // return jsonResponse['restaurants'];
    } else {
      return [];
    }
  } catch (e) {
    return [e];
  }
}
