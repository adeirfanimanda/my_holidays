import 'package:flutter/material.dart';
import 'package:my_holidays/models/tour_model.dart';

class WishListProvider with ChangeNotifier {
  List<TourModel> _wishList = [];

  List<TourModel> get wishlist => _wishList;

  set wishlist(List<TourModel> wishlist) {
    _wishList = wishlist;
    notifyListeners();
  }

  setTours(TourModel tours) {
    if (!isWishlist(tours)) {
      _wishList.add(tours);
    } else {
      _wishList.removeWhere((element) => element.id == tours.id);
    }

    notifyListeners();
  }

  isWishlist(TourModel tours) {
    if (_wishList.indexWhere((element) => element.id == tours.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
