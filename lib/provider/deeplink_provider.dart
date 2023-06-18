import 'package:flutter_riverpod/flutter_riverpod.dart';

final deepLinkStateNotifierProvider =
    StateNotifierProvider<DeepLinkStateNotifier, String>((ref) => DeepLinkStateNotifier());

class DeepLinkStateNotifier extends StateNotifier<String> {
  DeepLinkStateNotifier() : super('');

  void setLink(String link) {
    state = link;
  }
}
