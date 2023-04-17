import 'dart:async';

import 'package:flutter/material.dart';

import '../../../ui/characters/components/character_tile_widget.dart';
import '../../../ui/common/bottom_navigation_bar_widget.dart';

class CharactersViewModel {
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onReset;
  final ValueChanged<Completer> onRefresh;

  final List<CharacterProps> characters;
  final BottomNavigationBarProps bottomNavigationBarProps;

  CharactersViewModel({
    required this.isLoading,
    required this.errorMessage,
    required this.onReset,
    required this.onRefresh,
    required this.characters,
    required this.bottomNavigationBarProps,
  });
}
