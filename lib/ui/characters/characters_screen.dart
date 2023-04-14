import 'package:flutter/material.dart';

import '../../redux/characters/connector/characters_view_model.dart';
import '../common/bottom_navigation_bar_widget.dart';
import 'components/character_tile_widget.dart';

class CharactersScreen extends StatelessWidget {
  final CharactersViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CharactersScreen(
    this.viewModel,
    this.scaffoldKey, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: ListView.builder(
        itemCount: viewModel.characters.length,
        itemBuilder: (context, index) {
          return CharacterTileWidget(
            props: viewModel.characters[index],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        viewModel.bottomNavigationBarProps,
      ),
    );
  }
}
