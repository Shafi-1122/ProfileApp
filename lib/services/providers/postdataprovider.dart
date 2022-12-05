import 'package:avodha_test/model/postmodel.dart';
import 'package:avodha_test/services/postapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class DataClass extends ChangeNotifier {
  
  Future<void> postData(UserDetails body) async {
    
    
    http.Response response = (await updateuserdetails(body))!;
    if (response.statusCode == 200) {
     

    }
    
    
  }
}