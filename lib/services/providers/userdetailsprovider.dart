import 'dart:io';

import 'package:avodha_test/model/profilemodel.dart';
import 'package:avodha_test/services/getapi.dart';
import 'package:avodha_test/services/postapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UserdetailsProvider extends ChangeNotifier {
  ProfileDetailsClass profileDetailsClass = ProfileDetailsClass();

  late Future<ProfileDetails> userdetailsfromapi =
      profileDetailsClass.fetchUserDetails();

  var image;
  Future cameraImage() async {
    XFile? rawimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(rawimage!.path);

    notifyListeners();
  }
  void imagechanger(String url){
    image=url;
    notifyListeners();
  }
   Future<void> postData(Datum body) async {
    
    
    http.Response response = (await updateuserdetails(body))!;
    if (response.statusCode == 200) {
     

    }
    
    
  }
}
