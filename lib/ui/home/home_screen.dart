import 'package:flutter/material.dart';
import 'package:thrive_futurama/ui/common/futurama_error_widget.dart';

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
        title: const Text('Home'),
      ),
      body: Builder(builder: (context) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.errorMessage != null) {
          return FuturamaErrorWidget(
            viewModel.errorMessage!,
            viewModel.onReset,
          );
        }

        return HomeBodyWidget(viewModel.homeBodyProps);
      }),
      bottomNavigationBar: BottomNavigationBarWidget(
        viewModel.bottomNavigationBarProps,
      ),
    );
  }
}
