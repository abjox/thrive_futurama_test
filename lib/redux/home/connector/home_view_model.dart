import 'package:flutter/material.dart';

import '../../../ui/common/bottom_navigation_bar_widget.dart';
import '../../../ui/home/components/home_body_widget.dart';

class HomeViewModel {
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onReset;

  final HomeBodyProps homeBodyProps;
  final BottomNavigationBarProps bottomNavigationBarProps;

  HomeViewModel({
    required this.isLoading,
    required this.errorMessage,
    required this.onReset,
    required this.homeBodyProps,
    required this.bottomNavigationBarProps,
  });
}
