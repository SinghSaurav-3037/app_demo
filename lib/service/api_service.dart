import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {

  static const String _baseUrl =
      "https://stgtmfapp.dhwaniris.in/api/v2/document/TMF%20Project";


  Future<List<Map<String, dynamic>>> fetchProjects({String? status, String? program}) async {

    const String fields = '["project_name","name","area","district","project_type","program","status"]';
    String url = '$_baseUrl?fields=$fields';

    // To filter list
    final List<List<String>> filters = [];
    if (status != null) filters.add(['status', '=', status]);
    if (program != null) filters.add(['program', '=', program]);

    // Append filters to URL
    if (filters.isNotEmpty) {
      final String filterString = jsonEncode(filters);
      url += '&filters=$filterString';
    }


    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> data = json['data'] ?? [];

      return data
          .map<Map<String, dynamic>>((item) => Map<String, dynamic>.from(item))
          .toList();
    } else {
      // Throw exception  if request fails
      throw Exception('API error: ${response.statusCode}');
    }
  }
}
