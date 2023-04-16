import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../ui/common/bottom_navigation_bar_widget.dart';
import '../character_details/character_details_state.dart';
import '../characters/characters_state.dart';
import '../home/home_state.dart';
import '../quiz/quiz_state.dart';

enum DataStatus {
  initial,
  success,
  error,
  inProgress,
}

@immutable
class AppState extends Equatable {
  final DataStatus dataStatus;
  final String? errorMessage;
  final BottomBarItemTypes selectedItem;
  final HomeState homeState;
  final CharactersState charactersState;
  final CharacterDetailsState characterDetailsState;
  final QuizState quizState;

  const AppState({
    required this.dataStatus,
    required this.errorMessage,
    required this.selectedItem,
    required this.homeState,
    required this.charactersState,
    required this.characterDetailsState,
    required this.quizState,
  });

  factory AppState.initial() {
    return AppState(
      dataStatus: DataStatus.initial,
      errorMessage: null,
      selectedItem: BottomBarItemTypes.home,
      homeState: HomeState.initial(),
      charactersState: CharactersState.initial(),
      characterDetailsState: CharacterDetailsState.initial(),
      quizState: QuizState.initial(),
    );
  }

  AppState copyWith({
    DataStatus? dataStatus,
    String? errorMessage,
    BottomBarItemTypes? selectedItem,
    HomeState? homeState,
    CharactersState? charactersState,
    CharacterDetailsState? characterDetailsState,
    QuizState? quizState,
  }) {
    return AppState(
      dataStatus: dataStatus ?? this.dataStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedItem: selectedItem ?? this.selectedItem,
      homeState: homeState ?? this.homeState,
      charactersState: charactersState ?? this.charactersState,
      characterDetailsState:
          characterDetailsState ?? this.characterDetailsState,
      quizState: quizState ?? this.quizState,
    );
  }

  @override
  List<Object?> get props => [
        dataStatus,
        errorMessage,
        selectedItem,
        homeState,
        charactersState,
        characterDetailsState,
        quizState,
      ];
}
