import 'package:coodig_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseCoreProvider = Provider<FirebaseCore>((ref) => FirebaseCore());

class FirebaseCore {
  Future<void> init() async {
    bool canInitFirebase =
        DefaultFirebaseOptions.android.apiKey.isNotEmpty && DefaultFirebaseOptions.ios.apiKey.isNotEmpty;

    if (canInitFirebase) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  }
}

final isFirebaseAvailableProvider = Provider<bool>((ref) {
  try {
    Firebase.app();
    return true;
  } catch (e) {
    return false;
  }
});
