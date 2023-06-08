import 'package:flutter/material.dart';
import 'package:my_holidays/currency_formatter.dart';
import 'package:my_holidays/models/tour_model.dart';
import 'package:my_holidays/pages/tours_page.dart';
import 'package:provider/provider.dart';
import '../providers/wishlist_provider.dart';
import '../theme.dart';

class WishlistCard extends StatelessWidget {
  final TourModel tours;
  const WishlistCard(this.tours, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToursPage(tours),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        padding: const EdgeInsets.only(
          top: 10,
          left: 12,
          bottom: 14,
          right: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                // 'assets/6.jpg',
                tours.galleries[0].url,
                fit: BoxFit.cover,
                width: 60,
                height: 60,
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
                    tours.name,
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    formatCurrency(tours.price),
                    style: priceTextStyle,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                wishListProvider.setTours(tours);
              },
              child: Image.asset(
                'assets/button_wishlist_blue.png',
                width: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
