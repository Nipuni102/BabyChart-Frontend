import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchUserDetails(String token) async {
  final response = await http.get(
    Uri.parse('http://51.20.246.58/user'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['data'];
  } else {
    throw Exception('Failed to load user details');
  }
}
