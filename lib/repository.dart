import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos_petshop/model.dart';

class Repository {
  final _baseUrl = 'http://192.168.43.181:8000/api/news';

  Future<List<News>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        var it = jsonDecode(response.body);
        List<News> news = List<News>.from(it.map((e) => News.fromJson(e)));
        return news;
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Gagal memuat data');
    }
  }
}
