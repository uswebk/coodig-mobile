import 'package:coodig_mobile/enum/screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenItemProvider = StateProvider<ScreenItem>((ref) => ScreenItem.dashboard);
