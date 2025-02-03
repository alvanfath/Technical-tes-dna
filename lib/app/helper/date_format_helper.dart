import 'package:intl/intl.dart';

class DateFormatHelper {
  static String dateFormat({
    String format = 'dd MMMM yyyy',
    required String tanggal,
  }) {
    try {
      final parsedDate = DateTime.parse(tanggal).toLocal();
      final outputFormat = DateFormat(format, 'id_ID');

      final formattedDate = outputFormat.format(parsedDate);
      return formattedDate;
    } catch (e) {
      return 'Tanggal tidak valid';
    }
  }
}
