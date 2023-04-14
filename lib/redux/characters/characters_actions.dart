import '../../core/network/model/character.dart';

class CharactersPrepareDataAction {}

class CharactersDataReadyAction {
  final List<Character> characters;

  CharactersDataReadyAction(this.characters);
}
