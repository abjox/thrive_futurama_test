import 'package:flutter/material.dart';

enum BottomBarItemTypes { home, characters, quiz }

class BottomNavigationBarProps {
  final BottomBarItemTypes selectedItem;
  final VoidCallback onHome;
  final VoidCallback onCharacters;
  final VoidCallback onQuiz;

  BottomNavigationBarProps(
    this.selectedItem,
    this.onHome,
    this.onCharacters,
    this.onQuiz,
  );
}

class BottomNavigationBarWidget extends StatelessWidget {
  final BottomNavigationBarProps props;

  const BottomNavigationBarWidget(
    this.props, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Semantics(
            label: 'Home',
            child: const Icon(Icons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Semantics(
            label: 'Characters',
            child: const Icon(Icons.people),
          ),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: Semantics(
            label: 'Quiz',
            child: const Icon(Icons.quiz),
          ),
          label: 'Quiz',
        ),
      ],
      currentIndex: props.selectedItem.index,
      onTap: (index) {
        switch (index) {
          case 0:
            props.onHome();
            break;
          case 1:
            props.onCharacters();
            break;
          case 2:
            props.onQuiz();
            break;
        }
      },
    );
  }
}
