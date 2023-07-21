import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimeProvider = Provider<DateTimeCore>((ref) => DateTimeCore());

class DateTimeCore {
  DateTime now() => DateTime.now();
}
