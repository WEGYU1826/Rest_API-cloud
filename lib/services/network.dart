import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});
  final String? url;

  Future getData() async {
    Response? response;
    try {
      var url_1 = Uri.parse(url!);
      response = await get(url_1);
      // print(response.statusCode);
    } catch (e) {
      print(e);
    }
    if (response!.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
