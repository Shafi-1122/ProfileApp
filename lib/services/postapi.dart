import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:avodha_test/model/profilemodel.dart';
import 'package:http/http.dart' as http;



Future<http.Response?> updateuserdetails(Datum data) async {
  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update.php"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
        
  
  } catch (e) {
    log(e.toString());
  }
  return response;
}