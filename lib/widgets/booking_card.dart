import 'package:flutter/material.dart';
import 'package:my_holidays/currency_formatter.dart';
import 'package:my_holidays/models/cart_model.dart';
import 'package:my_holidays/theme.dart';

class BookingCard extends StatelessWidget {
  final CartModel cart;
  BookingCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  // 'assets/image_forest.jpeg',
                  cart.tours.galleries[0].url,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.tours.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  formatCurrency(cart.tours.price),
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
