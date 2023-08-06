import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/history/history_page.dart';
import 'package:coodig_mobile/feature/setting/setting_page.dart';
import 'package:flutter/material.dart';

enum ScreenItem {
  history,
  dashboard,
  setting,
}

extension ScreenItemExtensions on ScreenItem {
  Widget get screen {
    switch (this) {
      case ScreenItem.history:
        return const HistoryPage();
      case ScreenItem.dashboard:
        return const DashboardPage();
      case ScreenItem.setting:
        return const SettingPage();
      default:
        return Container();
    }
  }

  String get label {
    switch (this) {
      case ScreenItem.dashboard:
        return 'dashboard';
      case ScreenItem.history:
        return 'history';
      case ScreenItem.setting:
        return 'setting';
      default:
        return '';
    }
  }

  IconData get icon {
    switch (this) {
      case ScreenItem.history:
        return Icons.history;
      case ScreenItem.dashboard:
        return Icons.dashboard;
      case ScreenItem.setting:
        return Icons.settings;
      default:
        return Icons.dashboard;
    }
  }
}
