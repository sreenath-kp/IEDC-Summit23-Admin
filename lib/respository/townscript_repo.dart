import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:summit_admin_app/constants/secret.dart';

class TowscriptRepository {
  // final FirebaseFirestore _firestore;

  // TowscriptRepository({
  //   required FirebaseFirestore firestore,
  // }) : _firestore = firestore;

  Future<void> gettingData() async {
    final response = await http.get(
      Uri.parse(
        'https://www.townscript.com/api/registration/getRegisteredUsers?eventCode=-iedc-summit-demo-113112',
      ),
      headers: requestHeaders,
    );
    var data = jsonDecode(response.body);

    var data1 = jsonDecode(data["data"]);
    // print(data1);
    for (var d in data1) {
      print(d["answerList"][0]["answer"]);
      print(d["answerList"][1]["answer"]);
      print(d["answerList"][2]["answer"]);
      print(d["answerList"][3]["answer"]);
      print(d["answerList"][4]["answer"]);
      print(d["answerList"][5]["answer"]);
      print(d["answerList"][6]["answer"]);
      print(d["answerList"][7]["answer"]);
      // print(d["answerList"][8]["answer"]);
      // print(d["answerList"][9]["answer"]);
      print(d["userEmailId"]);
      print(d["allTicketName"]);
      print(d["ticketCurrency"]);
      print(d["registrationId"]);
    }
  }
}
