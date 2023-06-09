import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../ui/common/bottom_navigation_bar_widget.dart';
import '../../../ui/home/components/home_body_widget.dart';
import '../../../ui/home/home_screen.dart';
import '../../app/app_actions.dart';
import '../../app/app_state.dart';
import '../home_actions.dart';
import 'home_view_model.dart';

class HomeConnector extends StatelessWidget {
  final GlobalKey<ScaffoldState> _homeGlobalKey = GlobalKey();

  HomeConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      distinct: true,
      onInit: (store) {
        final homeState = store.state.homeState;
        if (homeState.info != null) {
          store.dispatch(HomeOpenAction());
          return;
        }
        store.dispatch(HomePrepareDataAction());
      },
      converter: (store) {
        final dataStatus = store.state.dataStatus;
        return HomeViewModel(
          isLoading: dataStatus == DataStatus.inProgress ||
              dataStatus == DataStatus.initial,
          errorMessage: store.state.errorMessage,
          onReset: () => store.dispatch(HomePrepareDataAction()),
          homeBodyProps: _mapToHomeBodyProps(store),
          bottomNavigationBarProps: _mapToBarProps(store),
        );
      },
      builder: (context, viewModel) => HomeScreen(
        viewModel,
        _homeGlobalKey,
      ),
    );
  }

  HomeBodyProps _mapToHomeBodyProps(Store<AppState> store) {
    final infoModel = store.state.homeState.info;
    return HomeBodyProps(
      infoModel?.synopsis ?? '',
      infoModel?.yearsAired ?? '',
      infoModel?.creators.map((e) => e.name).toList() ?? [],
      (completer) => store.dispatch(HomeRefreshDataAction(completer)),
    );
  }

  BottomNavigationBarProps _mapToBarProps(Store<AppState> store) {
    return BottomNavigationBarProps(
      store.state.selectedItem,
      () => store.dispatch(BottomBarNavigateAction(BottomBarItemTypes.home)),
      () => store
          .dispatch(BottomBarNavigateAction(BottomBarItemTypes.characters)),
      () => store.dispatch(BottomBarNavigateAction(BottomBarItemTypes.quiz)),
    );
  }
}
