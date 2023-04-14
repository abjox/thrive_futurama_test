import '../../../ui/character_details/components/character_details_body_widget.dart';

class CharacterDetailsViewModel {
  final bool isLoading;

  final String firstName;
  final CharacterDetailsBodyProps characterDetailsBodyProps;

  CharacterDetailsViewModel({
    required this.isLoading,
    required this.firstName,
    required this.characterDetailsBodyProps,
  });
}
