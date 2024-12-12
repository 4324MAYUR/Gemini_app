import 'dart:convert';
import 'package:http/http.dart' as http;

class APIHELPER {

  Future<String?> geminiAPI(String text) async {
    String link =   "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyDlmnTid3Xsn7iANKuWAplVc1umIiS2UdE";


    Map<String, dynamic> m1 = {
      "text": text,
    };

    http.Response res = await http.post(
      Uri.parse(link),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(m1),
    );
    if (res.statusCode == 200)
    {
      var data = jsonDecode(res.body);
      String l1 = data['text'];
      return l1;
    }
  }
}
