import 'package:intl/intl.dart';


dynamic dateConvertor(String value) {
  final DateTime now = DateTime.parse(value);
  String suffix = 'th';
  final int digit = now.day % 10;
  if ((digit > 0 && digit < 4) && (now.day < 11 || now.day > 13)) {
    suffix = <String>['st', 'nd', 'rd'][digit - 1];
  }
  return DateFormat("E, MMMM d'$suffix'").format(now); // 'Sun, Jun 30th'

}