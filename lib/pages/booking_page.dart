import 'package:flutter/material.dart';
import 'package:my_holidays/theme.dart';
import 'package:my_holidays/widgets/booking_card.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Booking Details',
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          // list items
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                BookingCard(),
                BookingCard(),
              ],
            ),
          ),

          // choosen holiday date
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choosen Holiday Date',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon_username.png',
                          width: 17,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            style: primaryTextStyle,
                            decoration: InputDecoration.collapsed(
                              hintText: 'DD/MM/YYYY',
                              hintStyle: subtitleTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
