import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/user-info.dart';

class MyService {
  var userInfo;
  dynamic httpService(String userName, String password) async {
    print(userName);
    var url =
        'http://ec2-65-0-129-29.ap-south-1.compute.amazonaws.com:8080/drops/user/signin?userEmail=$userName&password=$password';
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      userInfo = new UserInfo(jsonResponse['email'], jsonResponse['fullName'],
          jsonResponse['phoneNo'], jsonResponse['userId']);
      return userInfo;
    } else {
      print('some other status code');
    }
  }
}
