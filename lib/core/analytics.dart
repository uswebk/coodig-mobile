import 'package:coodig_mobile/core/firebase.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAnalytics = Provider((ref) => FirebaseAnalytics.instance);
final firebaseAnalyticsProvider =
    Provider((ref) => Analytics(ref.watch(firebaseAnalytics), ref.watch(isFirebaseAvailableProvider)));

class Analytics {
  Analytics(this.analytics, this.isFirebaseAvailable);
  final FirebaseAnalytics analytics;
  final bool isFirebaseAvailable;

  void logEvent({required String name, Map<String, dynamic>? parameters}) {
    assert(name.length <= 40, 'Parameter name must be 40 characters or less');

    if (kDebugMode) {
      print("[INFO] logEvent name: $name, parameters: $parameters");
    }

    if (!isFirebaseAvailable) {
      return;
    }

    analytics.logEvent(name: name, parameters: parameters);
  }
}
