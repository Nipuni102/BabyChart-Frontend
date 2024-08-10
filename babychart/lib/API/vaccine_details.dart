import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final String token;

  ApiService(this.baseUrl, this.token);

  Future<List<Vaccine>> fetchVaccines() async {
    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Parse JSON response
      return (data['data']['children'] as List)
          .where((child) => child['vaccines'] != null)
          .expand((child) => (child['vaccines'] as List))
          .map<Vaccine>((json) => Vaccine.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load vaccines');
    }
  }
}


class Vaccine {
  final String name;
  final String batchNo;
  final String vaccinatedDate;

  Vaccine({
    required this.name,
    required this.batchNo,
    required this.vaccinatedDate,
  });

  factory Vaccine.fromJson(Map<String, dynamic> json) {
    return Vaccine(
      name: json['name'],
      batchNo: json['batch_no'],
      vaccinatedDate: json['vaccinated_date'],
    );
  }
}
