import 'package:flutter/material.dart';
import 'package:my_holidays/currency_formatter.dart';
import 'package:my_holidays/providers/auth_provider.dart';
import 'package:my_holidays/providers/cart_provider.dart';
import 'package:my_holidays/providers/transaction_provider.dart';
import 'package:my_holidays/theme.dart';
import 'package:my_holidays/widgets/booking_card.dart';
import 'package:my_holidays/widgets/loading_button.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool isLoading = false;
  bool isCalendarOpen = false;
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleBooking() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.booking(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/booking-success', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: const Text(
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
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => BookingCard(cart),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 12,
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
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isCalendarOpen = !isCalendarOpen;
                    });

                    final DateTime today = DateTime.now();
                    final DateTime firstDate = today;
                    final DateTime lastDate =
                        today.add(const Duration(days: 30));
                    DateTime selectedDate = await showDatePicker(
                      context: context,
                      initialDate: today,
                      firstDate: firstDate,
                      lastDate: lastDate,
                      selectableDayPredicate: (DateTime date) {
                        return date.isAfter(
                                today.subtract(const Duration(days: 1))) &&
                            date.isBefore(today.add(const Duration(days: 31)));
                      },
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.light(),
                          child: child,
                        );
                      },
                    );

                    if (selectedDate != null) {
                      setState(() {
                        dateController.text =
                            DateFormat('dd/MM/yyyy').format(selectedDate);
                      });
                    }

                    setState(() {
                      isCalendarOpen = !isCalendarOpen;
                    });
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.asset(
                            'assets/icon_calendar.png',
                            width: 25,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              dateController.text.isNotEmpty
                                  ? dateController.text
                                  : 'DD/MM/YYYY',
                              style: dateController.text.isNotEmpty
                                  ? primaryTextStyle
                                  : subtitleTextStyle,
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

          // Container(
          //   margin: const EdgeInsets.only(top: 20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Choosen Holiday Date',
          //         style: primaryTextStyle.copyWith(
          //           fontSize: 16,
          //           fontWeight: medium,
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 12,
          //       ),
          //       Container(
          //         height: 50,
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 16,
          //         ),
          //         decoration: BoxDecoration(
          //           color: backgroundColor4,
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //         child: Center(
          //           child: Row(
          //             children: [
          //               Image.asset(
          //                 'assets/icon_username.png',
          //                 width: 17,
          //               ),
          //               const SizedBox(
          //                 width: 16,
          //               ),
          //               Expanded(
          //                 child: TextFormField(
          //                   style: primaryTextStyle,
          //                   decoration: InputDecoration.collapsed(
          //                     hintText: 'DD/MM/YYYY',
          //                     hintStyle: subtitleTextStyle,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // payment summary
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ticket Quantity',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()} Items',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ticket Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      formatCurrency(cartProvider.totalPrice()),
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fee',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '154',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      formatCurrency(cartProvider.totalPrice() + 154),
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // booking button
          SizedBox(
            height: defaultMargin,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          isLoading
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: LoadingButton(),
                )
              : Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: defaultMargin,
                  ),
                  child: TextButton(
                    onPressed: handleBooking,
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Booking Now',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
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
