import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:thrive_futurama/ui/character_details/character_details_screen.dart';

import '../../../ui/character_details/components/character_details_body_widget.dart';
import '../../app/app_state.dart';
import 'character_details_view_model.dart';

class CharacterDetailsConnector extends StatelessWidget {
  final GlobalKey<ScaffoldState> _characterDetailsGlobalKey = GlobalKey();

  CharacterDetailsConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CharacterDetailsViewModel>(
      distinct: true,
      converter: (store) {
        final character = store.state.characterDetailsState.character;
        return CharacterDetailsViewModel(
          isLoading: store.state.dataStatus == DataStatus.inProgress,
          firstName: character?.name.first ?? '',
          characterDetailsBodyProps: _mapToBodyProps(store),
        );
      },
      builder: (context, viewModel) => CharacterDetailsScreen(
        viewModel,
        _characterDetailsGlobalKey,
      ),
    );
  }

  CharacterDetailsBodyProps _mapToBodyProps(Store<AppState> store) {
    final character = store.state.characterDetailsState.character;
    return CharacterDetailsBodyProps(
      character?.images.main ?? '',
      character?.name.first ?? '',
      character?.name.middle ?? '',
      character?.name.last ?? '',
      character?.occupation ?? '',
      character?.gender ?? '',
      character?.species ?? '',
      character?.homePlanet ?? 'none',
      character?.sayings ?? [],
    );
  }
}
