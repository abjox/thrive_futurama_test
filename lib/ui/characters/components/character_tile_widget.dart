import 'package:cached_network_image/cached_network_image.dart';
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
      leading: ExcludeSemantics(
        child: CachedNetworkImage(
          imageUrl: props.image,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      title: Semantics(
        label: '${props.lastName} ${props.lastName}',
        child: Text('${props.lastName} ${props.lastName}'),
      ),
      onTap: props.onPressed,
    );
  }
}
