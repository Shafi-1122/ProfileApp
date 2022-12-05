import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:avodha_test/model/postmodel.dart';
import 'package:http/http.dart' as http;



Future<http.Response?> updateuserdetails(UserDetails data) async {
  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update.php"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
        
         print(response.body);
  } catch (e) {
    log(e.toString());
  }
  return response;
}