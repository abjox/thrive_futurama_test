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
