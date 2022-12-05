import 'dart:io';

import 'package:avodha_test/model/profilemodel.dart';
import 'package:avodha_test/services/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UserdetailsProvider extends ChangeNotifier {
  ProfileDetailsClass profileDetailsClass = ProfileDetailsClass();

  late Future<ProfileDetails> userdetailsfromapi =
      profileDetailsClass.fetchUserDetails();

  var image;
  Future cameraImage() async {
    XFile? rawimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(rawimage!.path);
    print(image);
    notifyListeners();
  }
  void imagechanger(String url){
    image=url;
    notifyListeners();
  }
}
