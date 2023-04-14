import 'package:redux/redux.dart';

import '../characters/characters_actions.dart';
import 'character_details_state.dart';

final characterDetailsReducer = combineReducers<CharacterDetailsState>([
  TypedReducer(_charactersOpenDetailsAction),
]);

CharacterDetailsState _charactersOpenDetailsAction(
    CharacterDetailsState homeState, CharactersOpenDetailsAction action) {
  return homeState.copyWith(character: action.character);
}
