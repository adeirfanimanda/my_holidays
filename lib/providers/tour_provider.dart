import 'package:flutter/material.dart';
import 'package:my_holidays/models/tour_model.dart';
import 'package:my_holidays/services/tour_service.dart';

class TourProvider with ChangeNotifier {
  List<TourModel> _tours = [];

  List<TourModel> get tours => _tours;

  set tours(List<TourModel> tours) {
    _tours = tours;
    notifyListeners();
  }

  Future<void> getTours() async {
    try {
      List<TourModel> tours = await TourService().getTours();
      _tours = tours;
    } catch (e) {
      print(e);
    }
  }
}
