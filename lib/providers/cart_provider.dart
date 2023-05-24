import 'package:flutter/material.dart';
import 'package:my_holidays/models/cart_model.dart';
import 'package:my_holidays/models/tour_model.dart';

class CardProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(TourModel tours) {
    if (toursExists(tours)) {
      int index = _carts.indexWhere((element) => element.tours.id == tours.id);
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          tours: tours,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.tours.price);
    }
    return total;
  }

  toursExists(TourModel tours) {
    if (_carts.indexWhere((element) => element.tours.id == tours.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
