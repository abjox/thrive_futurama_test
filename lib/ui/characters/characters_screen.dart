import 'package:flutter/material.dart';

import '../../redux/characters/connector/characters_view_model.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              // TODO: Implement characters screen.
              break;
            case 1:
              // TODO: Implement quiz screen.
              break;
            case 2:
              // TODO: Implement quiz screen.
              break;
          }
        },
      ),
    );
  }
}
