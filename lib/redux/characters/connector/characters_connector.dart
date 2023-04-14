import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../ui/characters/characters_screen.dart';
import '../../../ui/characters/components/character_tile_widget.dart';
import '../../../ui/common/bottom_navigation_bar_widget.dart';
import '../../app/app_actions.dart';
import '../../app/app_state.dart';
import '../characters_actions.dart';
import 'characters_view_model.dart';

class CharactersConnector extends StatelessWidget {
  final GlobalKey<ScaffoldState> _charactersGlobalKey = GlobalKey();

  CharactersConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CharactersViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(CharactersPrepareDataAction()),
      converter: (store) {
        return CharactersViewModel(
          isLoading: store.state.dataStatus == DataStatus.inProgress,
          characters: _mapToCharacterProps(store),
          bottomNavigationBarProps: _mapToBarProps(store),
        );
      },
      builder: (context, viewModel) => CharactersScreen(
        viewModel,
        _charactersGlobalKey,
      ),
    );
  }

  List<CharacterProps> _mapToCharacterProps(Store<AppState> store) {
    final characters = store.state.charactersState.characters;
    return characters.map((e) {
      return CharacterProps(
        e.name.first,
        e.name.last,
        e.images.main,
        () => store.dispatch(CharactersOpenDetailsAction(e)),
      );
    }).toList();
  }

  BottomNavigationBarProps _mapToBarProps(Store<AppState> store) {
    return BottomNavigationBarProps(
      store.state.selectedItem,
      () => store.dispatch(BottomBarNavigateAction(BottomBarItemTypes.home)),
      () => store
          .dispatch(BottomBarNavigateAction(BottomBarItemTypes.characters)),
      () => store.dispatch(BottomBarNavigateAction(BottomBarItemTypes.quiz)),
    );
  }
}
