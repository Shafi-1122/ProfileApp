



import 'package:avodha_test/model/profilemodel.dart';
import 'package:http/http.dart' as http;
class ProfileDetailsClass{
  Future<ProfileDetails> fetchUserDetails() async {
  final response = await http.get(Uri.parse(
      'http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update_list.php?user_id=1'));
  if (response.statusCode == 200) {
    ProfileDetails userdetails = profiletojsonFromJson(response.body);
   
    return userdetails;
  } else {
    throw Exception();
  }
}

}
