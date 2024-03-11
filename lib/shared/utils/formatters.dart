import 'package:intl/intl.dart';

class Formatters {
  static String formatarDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return 'Sem Dado';
    }

    final formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    final formattedTime = DateFormat('HH:mm').format(dateTime);

    return '$formattedDate $formattedTime';
  }

  static String doubleToReaisString(double valor) {
    final formattedValue =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(valor);
    return formattedValue;
  }
}
