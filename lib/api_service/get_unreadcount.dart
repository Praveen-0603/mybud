import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> getUnreadCount(String token) async {
  try {
    http.Response response = await http.get(
      Uri.parse('https://mybud.herokuapp.com/user/getUnreadMessages'),
      headers: {'Authorization': 'Bearer ' + token},
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return data['data'];
    } else {
      print('error');
      return 0;
    }
  } catch (e) {
    print(e);
    return 0;
  }
}
