import 'package:flutter/material.dart';
import 'package:thrive_futurama/redux/character_details/connector/character_details_view_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterDetailsViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CharacterDetailsScreen(
    this.viewModel,
    this.scaffoldKey, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(viewModel.firstName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              viewModel.image,
              fit: BoxFit.fitHeight,
              width: 90.0,
              height: 90.0,
            ),
            const SizedBox(height: 16.0),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: viewModel.firstName),
                const TextSpan(text: ' '),
                if (viewModel.middleName.isNotEmpty)
                  TextSpan(text: viewModel.middleName),
                if (viewModel.middleName.isNotEmpty) const TextSpan(text: ' '),
                TextSpan(text: viewModel.lastName),
              ]),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              viewModel.occupation,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Biography',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8.0),
            _DetailRowWidget('Gender', viewModel.gender),
            _DetailRowWidget('Species', viewModel.species),
            _DetailRowWidget('Home Planet', viewModel.homePlanet),
            const SizedBox(height: 16.0),
            Text(
              'Sayings',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.sayings.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '- ${viewModel.sayings[index]}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
            ),
          ],
        ),
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
