import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'http://192.168.56.1:8000/api';
  // String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> booking(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/booking';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'choose_date': "2023-05-28",
        'items': carts
            .map(
              (cart) => {
                'id': cart.tours.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': "PENDING",
        'total_price': totalPrice,
        'fee': 154,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal melakukan booking!');
    }
  }
}
