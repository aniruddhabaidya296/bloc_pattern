import 'dart:convert';

import 'package:bloc_patter_example_app/models/student.dart';
import 'package:http/http.dart' as http;

class StudentDao {
  Future fetchStudent() async {
    Student student = new Student();
    student.createStudent("John Doe", "12", "HSMS", "CBSE");
    Map<String, dynamic> response = new Map();
    response.putIfAbsent("body", () => student.toJson());
    response.putIfAbsent("statusCode", () => 200);
    return jsonEncode(response);
  }
}
