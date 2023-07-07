import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimeServiceProvider = Provider<DateTimeService>((ref) => DateTimeService());

class DateTimeService {
  DateTime now() => DateTime.now();
}
