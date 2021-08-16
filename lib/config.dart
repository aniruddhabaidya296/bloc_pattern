import 'dart:io';

class Config {
  static String accessToken = '';
  static int userId = 0;
  static bool profileCompleted = false;
  static int bikeId = 2;
  static int autoId = 1;

  static String url = 'https://api.comride.com';

  static Map<String, String> headers() {
    return {
      HttpHeaders.contentTypeHeader: "Application/json",
    };
  }

  static Map<String, String> authHeaders() {
    return {
      HttpHeaders.contentTypeHeader: "Application/json",
      "x-access-token": "${Config.accessToken}",
    };
  }

  static String googleKey = "AIzaSyA6pAOQKgM_jbXJLx-KI_aQjK4Rwks5SO0";
  static String razorpayKey = "rzp_test_xBhosNX0Y8G9cq";
  static String rideId = "";
}
