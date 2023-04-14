import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../ui/common/bottom_navigation_bar_widget.dart';
import '../characters/characters_state.dart';
import '../home/home_state.dart';

enum DataStatus {
  initial,
  success,
  error,
  inProgress,
}

@immutable
class AppState extends Equatable {
  final DataStatus dataStatus;
  final BottomBarItemTypes selectedItem;
  final HomeState homeState;
  final CharactersState charactersState;

  const AppState({
    required this.dataStatus,
    required this.selectedItem,
    required this.homeState,
    required this.charactersState,
  });

  factory AppState.initial() {
    return AppState(
      dataStatus: DataStatus.initial,
      selectedItem: BottomBarItemTypes.home,
      homeState: HomeState.initial(),
      charactersState: CharactersState.initial(),
    );
  }

  AppState copyWith({
    DataStatus? dataStatus,
    BottomBarItemTypes? selectedItem,
    HomeState? homeState,
    CharactersState? charactersState,
  }) {
    return AppState(
      dataStatus: dataStatus ?? this.dataStatus,
      selectedItem: selectedItem ?? this.selectedItem,
      homeState: homeState ?? this.homeState,
      charactersState: charactersState ?? this.charactersState,
    );
  }

  @override
  List<Object> get props => [
        dataStatus,
        selectedItem,
        homeState,
        charactersState,
      ];
}
