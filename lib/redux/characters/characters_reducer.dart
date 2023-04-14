import 'package:redux/redux.dart';
import 'package:thrive_futurama/redux/characters/characters_actions.dart';

import 'characters_state.dart';

final charactersReducer = combineReducers<CharactersState>([
  TypedReducer(_homeDataReadyAction),
]);

CharactersState _homeDataReadyAction(
  CharactersState charactersState,
  CharactersDataReadyAction action,
) {
  return charactersState.copyWith(characters: action.characters);
}
