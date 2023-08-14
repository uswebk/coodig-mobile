import 'package:coodig_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseCoreProvider = Provider<FirebaseCore>((ref) => FirebaseCore());

class FirebaseCore {
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
