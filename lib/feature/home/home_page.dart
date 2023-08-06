import 'package:coodig_mobile/enum/screen.dart';
import 'package:coodig_mobile/provider/page_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NOTE: Default Dashboard Page
    final screen = ref.watch(screenItemProvider);

    return Scaffold(
      body: screen.screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screen.index,
        onTap: (index) => ref.read(screenItemProvider.notifier).state = ScreenItem.values[index],
        items: <BottomNavigationBarItem>[
          for (var item in ScreenItem.values) BottomNavigationBarItem(icon: Icon(item.icon), label: item.label),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
