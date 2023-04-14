import '../../core/app_router.dart';
import '../../core/network/model/character.dart';
import '../app/app_actions.dart';

class CharactersPrepareDataAction {}

class CharactersDataReadyAction {
  final List<Character> characters;

  CharactersDataReadyAction(this.characters);
}

class CharactersOpenDetailsAction implements NavigatePushAction {
  @override
  AppRoutes get route => AppRoutes.characterDetails;

  final Character character;

  CharactersOpenDetailsAction(this.character);
}
