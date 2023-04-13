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
  final String routeName;

  NavigatePushAction(this.routeName);

  @override
  String toString() => 'Route: $routeName';
}

class NavigatePopAction {
  @override
  String toString() => '';
}

class NavigateReplaceAction {
  final String routeName;

  NavigateReplaceAction(this.routeName);

  @override
  String toString() => 'Route: $routeName';
}

// Error

class ErrorOccurredAction {
  @override
  String toString() =>
      throw UnsupportedError('Should be overridden in subclass');
}

class DismissErrorAction {
  @override
  String toString() =>
      throw UnsupportedError('Should be overridden in subclass');
}
