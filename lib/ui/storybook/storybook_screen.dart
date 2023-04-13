import 'package:flutter/material.dart';

import '../characters/characters_screen.dart';
import '../character_details/character_details_screen.dart';
import '../quiz/quiz_screen.dart';
import '../home/home_screen.dart';
import 'mock_models.dart';

enum Screen {
  home,
  characters,
  characterDetails,
  quiz,
}

enum HomeState { initial }

enum CharctersState { initial }

enum CharacterDetailsState { initial }

enum QuizState { initial }

class StorybookScreen extends StatelessWidget {
  const StorybookScreen({super.key});

  List<Widget> generateScreenStates(BuildContext context, Screen screen) {
    switch (screen) {
      case Screen.home:
        return buildHomeState(context);
      case Screen.characters:
        return buildCharactersState(context);
      case Screen.characterDetails:
        return buildCharacterDetailsState(context);
      case Screen.quiz:
        return buildQuizState(context);
      default:
        return [];
    }
  }

  List<Widget> buildHomeState(BuildContext context) {
    return HomeState.values.map((e) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextButton(
            onPressed: () {
              if (e == HomeState.initial) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen(
                        mockInitialHomeStateViewModel,
                        GlobalKey(),
                      );
                    },
                  ),
                );
              }
            },
            child: Text(e.toString().split('.')[1]),
          ));
    }).toList();
  }

  List<Widget> buildCharactersState(BuildContext context) {
    return CharctersState.values.map((e) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextButton(
            onPressed: () {
              if (e == CharctersState.initial) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CharactersScreen(
                        mockInitialCharctersStateViewModel,
                        GlobalKey(),
                      );
                    },
                  ),
                );
              }
            },
            child: Text(e.toString().split('.')[1]),
          ));
    }).toList();
  }

  List<Widget> buildCharacterDetailsState(BuildContext context) {
    return CharacterDetailsState.values.map((e) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextButton(
            onPressed: () {
              if (e == CharacterDetailsState.initial) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CharacterDetailsScreen(
                        mockInitialCharcterDetailsStateViewModel,
                        GlobalKey(),
                      );
                    },
                  ),
                );
              }
            },
            child: Text(e.toString().split('.')[1]),
          ));
    }).toList();
  }

  List<Widget> buildQuizState(BuildContext context) {
    return QuizState.values.map((e) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextButton(
            onPressed: () {
              if (e == QuizState.initial) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizScreen(
                        mockInitialQuizStateViewModel,
                        GlobalKey(),
                      );
                    },
                  ),
                );
              }
            },
            child: Text(e.toString().split('.')[1]),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        // backgroundColor: AppColors.mustard,
        title: const Text('Storybook'),
      ),
      body: ListView.builder(
        itemCount: Screen.values.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(Screen.values[index].toString().split('.')[1]),
            children: generateScreenStates(context, Screen.values[index]),
          );
        },
      ),
    );
  }
}
