import 'dart:io';
import 'package:http/http.dart' as http;

class TowscriptRepository {
  // final FirebaseFirestore _firestore;

  // TowscriptRepository({
  //   required FirebaseFirestore firestore,
  // }) : _firestore = firestore;
  Map<String, String> requestHeaders = {
    //  'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'eyJhbGciOiJIUzUxMiJ9.eyJST0xFIjoiUk9MRV9VU0VSIiwic3ViIjoidHZlMjFjczA4MEBjZXQuYWMuaW4iLCJhdWRpZW5jZSI6IndlYiIsImNyZWF0ZWQiOjE2OTU5MTIyNjQyMzksIk1BR0lDX0xPR0lOIjpmYWxzZSwiVVNFUl9JRCI6NDc5NDY2NywiZXhwIjoxNzAzNjg4MjY0fQ._MffCnYUghXKNM1QZ48B0qux76fZqnPHmwcPhFZMQyrOzmzwekO3qR5I_f0yQYXL5cjMNIPlkLzUPMTYfsxOgA'
  };

  Future<void> gettingData() async {
    final response = await http.get(
      Uri.parse(
        'https://www.townscript.com/api/registration/getRegisteredUsers?eventCode=-iedc-summit-demo-113112',
      ),
      // headers: {
      //   'Authorization':
      //       'sha512-cqJ7zgiK/NWe+oMgCsmuf4Zil+vkZJJrEaZcwAX9XaQWwMS10ZJIncLT31fmnVSC2LwmEeXY8kBiYeO16VrjKw==?xOgA'
      // },
      headers: requestHeaders,
    );

    print(response.body);
  }
}
