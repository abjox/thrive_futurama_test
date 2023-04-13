import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import 'mock_models.dart';

enum Screen {
  home,
}

enum HomeState { initial }

class StorybookScreen extends StatelessWidget {
  const StorybookScreen({super.key});

  List<Widget> generateScreenStates(BuildContext context, Screen screen) {
    switch (screen) {
      case Screen.home:
        return buildHomeState(context);
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
