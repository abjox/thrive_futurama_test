import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../redux/home/connector/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeScreen(
    this.viewModel,
    this.scaffoldKey, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        final isTablet =
            sizingInformation.deviceScreenType == DeviceScreenType.tablet;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Synopsis',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.synopsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'Years Aired',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.yearsAired,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  'Creators',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                ...List<Widget>.generate(
                  viewModel.creators.length,
                  (index) {
                    final creator = viewModel.creators[index];
                    return ListTile(
                      title: Text(creator),
                      onTap: () {
                        // TODO: Implement creator details screen.
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                if (!isTablet)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: const Text('Characters'),
                        onPressed: () {
                          // TODO: Implement characters screen.
                        },
                      ),
                      ElevatedButton(
                        child: Text('Quiz'),
                        onPressed: () {
                          // TODO: Implement quiz screen.
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
          bottomNavigationBar: isTablet
              ? null
              : BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people),
                      label: 'Characters',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.quiz),
                      label: 'Quiz',
                    ),
                  ],
                  currentIndex: 0,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        // TODO: Implement characters screen.
                        break;
                      case 1:
                        // TODO: Implement quiz screen.
                        break;
                    }
                  },
                ),
        );
      },
    );
  }
}
