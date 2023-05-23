import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_holidays/models/tour_model.dart';

class TourService {
  String baseUrl = 'http://192.168.56.1:8000/api';
  // String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<TourModel>> getTours() async {
    var url = '$baseUrl/tours';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<TourModel> tours = [];

      for (var item in data) {
        tours.add(TourModel.fromJson(item));
      }

      return tours;
    } else {
      throw Exception('Gagal get Tours!');
    }
  }
}
