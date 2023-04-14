import '../../../ui/characters/components/character_tile_widget.dart';
import '../../../ui/common/bottom_navigation_bar_widget.dart';

class CharactersViewModel {
  final bool isLoading;

  final List<CharacterProps> characters;
  final BottomNavigationBarProps bottomNavigationBarProps;

  CharactersViewModel({
    required this.isLoading,
    required this.characters,
    required this.bottomNavigationBarProps,
  });
}
