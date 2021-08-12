import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart' as Constants;

import '../model/blood_supply_type.dart';

class BloodSupplyService {
  static Future<List<BloodSupply>> fetchData() async {
    final response = await http.get(Uri.parse(Constants.DATA_URL));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>) //
          .map((e) => BloodSupply.json(e)) //
          .toList();
    } else {
      throw Exception('Failed fetching blood data');
    }
  }
}
