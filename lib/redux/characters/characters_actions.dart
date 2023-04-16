import '../../core/app_router.dart';
import '../../core/network/model/character.dart';
import '../app/app_actions.dart';
import '../app/app_state.dart';

class CharactersPrepareDataAction {}

class CharactersDataReadyAction extends ClearErrorAction
    implements ChangeDataStatusAction {
  final List<Character> characters;

  CharactersDataReadyAction(this.characters);

  @override
  DataStatus get dataStatus => DataStatus.success;
}

class CharactersOpenDetailsAction implements NavigatePushAction {
  @override
  AppRoutes get route => AppRoutes.characterDetails;

  final Character character;

  CharactersOpenDetailsAction(this.character);
}
