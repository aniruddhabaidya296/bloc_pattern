import 'dart:convert';

import 'package:http/http.dart' as http;

class HealthProductsDao {
  Future fetchHealthProducts({String category}) async {
    var url =
        'https://pharmacity-dgpb.herokuapp.com/api/v1/healthcare-products?category=$category';

    final response = await http.get(
      Uri.parse(url),
    );
    // print(response.body);
    // print(response.statusCode);
    return response;
  }
}
