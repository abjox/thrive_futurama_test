import 'package:flutter/material.dart';

class CharacterProps {
  final String firstName;
  final String lastName;
  final String image;
  final VoidCallback onPressed;

  CharacterProps(this.firstName, this.lastName, this.image, this.onPressed);
}

class CharacterTileWidget extends StatelessWidget {
  const CharacterTileWidget({
    super.key,
    required this.props,
  });

  final CharacterProps props;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(props.image),
      title: Text(props.firstName),
      subtitle: Text(props.lastName),
      onTap: props.onPressed,
    );
  }
}
