import 'package:http/http.dart' as http;

class UniversityDao {
  Future fetchUniversity() async {
    var url = 'http://universities.hipolabs.com/search?country=Australia';

    final response = await http.get(Uri.parse(url));
    // print(response.body);
    // print(response.statusCode);
    return response;
  }
}
