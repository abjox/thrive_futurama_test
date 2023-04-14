import '../../../ui/common/bottom_navigation_bar_widget.dart';
import '../../../ui/home/components/home_body_widget.dart';

class HomeViewModel {
  final bool isLoading;

  final HomeBodyProps homeBodyProps;
  final BottomNavigationBarProps bottomNavigationBarProps;

  HomeViewModel({
    required this.isLoading,
    required this.homeBodyProps,
    required this.bottomNavigationBarProps,
  });
}
