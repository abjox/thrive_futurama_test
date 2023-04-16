import 'package:flutter/material.dart';

import '../../redux/characters/connector/characters_view_model.dart';
import '../common/bottom_navigation_bar_widget.dart';
import '../common/futurama_error_widget.dart';
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
        title: Semantics(
          label: 'Characters',
          child: const Text('Characters'),
        ),
      ),
      body: Builder(
        builder: (ontext) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return FuturamaErrorWidget(
              viewModel.errorMessage!,
              viewModel.onReset,
            );
          }

          return ListView.builder(
            itemCount: viewModel.characters.length,
            itemBuilder: (context, index) {
              return Semantics(
                label: 'Item $index',
                child: CharacterTileWidget(
                  props: viewModel.characters[index],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        viewModel.bottomNavigationBarProps,
      ),
    );
  }
}
