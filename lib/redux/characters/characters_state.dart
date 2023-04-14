import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../core/network/model/character.dart';

@immutable
class CharactersState extends Equatable {
  final List<Character> characters;

  const CharactersState({
    required this.characters,
  });

  factory CharactersState.initial() {
    return const CharactersState(
      characters: [],
    );
  }

  CharactersState copyWith({
    List<Character>? characters,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
    );
  }

  @override
  List<Object> get props => [
        characters,
      ];
}
