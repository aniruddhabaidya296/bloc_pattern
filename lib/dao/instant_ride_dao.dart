import 'dart:convert';

import 'package:bloc_patter_example_app/models/driver.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class InstantRideDao {
  Future fetchDriver(String driverId) async {
    var url = '${Config.url}/api/user/fetch-driver';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({"driverId": driverId}),
      headers: Config.authHeaders(),
    );

    print(response.body.toString());
    print('Response status:${response.statusCode}');
    print('Response body:${response.body}');

    return response;
  }
}
