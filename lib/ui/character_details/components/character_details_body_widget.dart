import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterDetailsBodyProps {
  final String imageUrl;
  final String firstName;
  final String middleName;
  final String lastName;
  final String occupation;
  final String gender;
  final String species;
  final String homePlanet;
  final List<String> sayings;

  CharacterDetailsBodyProps(
    this.imageUrl,
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

class CharacterDetailsBodyWidget extends StatelessWidget {
  final CharacterDetailsBodyProps props;
  const CharacterDetailsBodyWidget(this.props, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: props.imageUrl,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 120,
            height: 120,
          ),
          const SizedBox(height: 16.0),
          Text.rich(
            TextSpan(children: [
              TextSpan(text: props.firstName),
              const TextSpan(text: ' '),
              if (props.middleName.isNotEmpty) TextSpan(text: props.middleName),
              if (props.middleName.isNotEmpty) const TextSpan(text: ' '),
              TextSpan(text: props.lastName),
            ]),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            props.occupation,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16.0),
          Text(
            'Biography',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8.0),
          _DetailRowWidget('Gender', props.gender),
          _DetailRowWidget('Species', props.species),
          _DetailRowWidget('Home Planet', props.homePlanet),
          const SizedBox(height: 16.0),
          Text(
            'Sayings',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: props.sayings.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- ${props.sayings[index]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DetailRowWidget extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRowWidget(
    this.label,
    this.value,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
