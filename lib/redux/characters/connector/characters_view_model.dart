import 'package:thrive_futurama/ui/characters/components/character_tile_widget.dart';

class CharactersViewModel {
  final bool isLoading;
  final bool isError;

  final List<CharacterProps> characters;

  CharactersViewModel(
    this.isLoading,
    this.isError,
    this.characters,
  );
}
