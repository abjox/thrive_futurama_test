import 'package:flutter/material.dart';

import '../../redux/home/connector/home_view_model.dart';
import '../common/bottom_navigation_bar_widget.dart';
import 'components/home_body_widget.dart';

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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: HomeBodyWidget(viewModel.homeBodyProps),
      bottomNavigationBar: BottomNavigationBarWidget(
        viewModel.bottomNavigationBarProps,
      ),
    );
  }
}
