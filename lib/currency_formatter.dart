import 'package:intl/intl.dart';

String formatCurrency(double value) {
  final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
  var formattedValue = formatCurrency.format(value);
  formattedValue = formattedValue.replaceAll(',00', '');
  return formattedValue;
}
