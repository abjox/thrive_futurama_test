import 'package:flutter/material.dart';

class FuturamaErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onReset;

  const FuturamaErrorWidget(
    this.errorMessage,
    this.onReset, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Semantics(
              label: errorMessage,
              child: Text(
                errorMessage,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Semantics(
            label: 'Retry',
            button: true,
            child: ElevatedButton(
              onPressed: onReset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Retry',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
