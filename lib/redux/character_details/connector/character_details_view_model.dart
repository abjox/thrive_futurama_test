class CharacterDetailsViewModel {
  final bool isLoading;
  final bool isError;

  final String image;
  final String firstName;
  final String middleName;
  final String lastName;
  final String occupation;
  final String gender;
  final String species;
  final String homePlanet;
  final List<String> sayings;

  CharacterDetailsViewModel(
    this.isLoading,
    this.isError,
    this.image,
    this.firstName,
    this.middleName,
    this.lastName,
    this.occupation,
    this.gender,
    this.species,
    this.homePlanet,
    this.sayings,
  );
}
