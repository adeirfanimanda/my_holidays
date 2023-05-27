import 'package:my_holidays/models/tour_model.dart';

class CartModel {
  int id;
  TourModel tours;
  int quantity;

  CartModel({
    this.id,
    this.tours,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tours = TourModel.fromJson(json['tours']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tours': tours.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return tours.price * quantity;
  }
}
