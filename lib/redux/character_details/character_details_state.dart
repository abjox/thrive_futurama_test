import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../core/network/model/character.dart';

@immutable
class CharacterDetailsState extends Equatable {
  final Character? character;

  const CharacterDetailsState({
    required this.character,
  });

  factory CharacterDetailsState.initial() {
    return const CharacterDetailsState(
      character: null,
    );
  }

  CharacterDetailsState copyWith({
    Character? character,
  }) {
    return CharacterDetailsState(
      character: character ?? this.character,
    );
  }

  @override
  List<Object?> get props => [
        character,
      ];
}
