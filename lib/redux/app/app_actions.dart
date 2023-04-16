import 'package:thrive_futurama/core/app_router.dart';
import 'package:thrive_futurama/ui/common/bottom_navigation_bar_widget.dart';

import 'app_state.dart';

class StartApplicationAction {}

class ChangeDataStatusAction {
  final DataStatus dataStatus;

  ChangeDataStatusAction(this.dataStatus);

  @override
  String toString() => 'Data status: $dataStatus';
}

// Navigation

class NavigatePushAction {
  final AppRoutes route;

  NavigatePushAction(this.route);

  @override
  String toString() => 'Route: ${route.path}';
}

class NavigatePopAction {
  @override
  String toString() => '';
}

class NavigateReplaceAction {
  final AppRoutes route;

  NavigateReplaceAction(this.route);

  @override
  String toString() => 'Route: ${route.path}';
}

class BottomBarNavigateAction implements NavigateReplaceAction {
  final BottomBarItemTypes item;

  BottomBarNavigateAction(this.item);

  @override
  AppRoutes get route {
    switch (item) {
      case BottomBarItemTypes.home:
        return AppRoutes.home;
      case BottomBarItemTypes.characters:
        return AppRoutes.characters;
      case BottomBarItemTypes.quiz:
        return AppRoutes.quiz;
    }
  }
}

// Error

class ErrorOccurredAction implements ChangeDataStatusAction {
  final String message;

  ErrorOccurredAction(this.message);

  @override
  DataStatus get dataStatus => DataStatus.error;
}

class ClearErrorAction implements ChangeDataStatusAction {
  @override
  DataStatus get dataStatus => DataStatus.success;
}
