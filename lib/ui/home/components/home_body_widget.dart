import 'package:flutter/material.dart';

class HomeBodyProps {
  final String synopsis;
  final String yearsAired;
  final List<String> creators;

  HomeBodyProps(
    this.synopsis,
    this.yearsAired,
    this.creators,
  );
}

class HomeBodyWidget extends StatelessWidget {
  final HomeBodyProps props;

  const HomeBodyWidget(this.props, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            label: 'Synopsis',
            child: Text(
              'Synopsis',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 8),
          Semantics(
            label: props.synopsis,
            child: Text(
              props.synopsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 16),
          Semantics(
            label: 'Years Aired',
            child: Text(
              'Years Aired',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 8),
          Semantics(
            label: props.yearsAired,
            child: Text(
              props.yearsAired,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
          Semantics(
            label: 'Creators',
            child: Text(
              'Creators',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 8),
          ...List<Widget>.generate(
            props.creators.length,
            (index) {
              return Semantics(
                label: props.creators[index],
                child: Text(
                  props.creators[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
