import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAnalytics = Provider((ref) => FirebaseAnalytics.instance);
final firebaseAnalyticsProvider = Provider((ref) => Analytics(ref.watch(firebaseAnalytics)));

class Analytics {
  Analytics(this.analytics);
  final FirebaseAnalytics analytics;

  void logEvent({required String name, Map<String, dynamic>? parameters}) {
    assert(name.length <= 40, 'Parameter name must be 40 characters or less');

    if (kDebugMode) {
      print("[INFO] logEvent name: $name, parameters: $parameters");
    }

    analytics.logEvent(name: name, parameters: parameters);
  }
}

final analyticsObserver = Provider((ref) {
  final analytics = ref.watch(firebaseAnalytics);
  return [FirebaseAnalyticsObserver(analytics: analytics)];
});
