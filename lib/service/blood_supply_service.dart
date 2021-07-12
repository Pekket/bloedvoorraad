import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/blood_supply_type.dart';

const URL = "https://europe-west1-rodekruis-bloedvoorraad.cloudfunctions.net/bloedvoorraad";

class BloodSupplyService {

  static Future<List<BloodSupply>> fetchData() async {
    final response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => BloodSupply.json(e))
          .toList();
    } else {
      throw Exception('Failed fetching blood data');
    }
  }
}
