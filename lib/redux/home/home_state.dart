import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../core/network/model/info.dart';

@immutable
class HomeState extends Equatable {
  final Info? info;

  const HomeState({
    required this.info,
  });

  factory HomeState.initial() {
    return const HomeState(
      info: null,
    );
  }

  HomeState copyWith({
    Info? info,
  }) {
    return HomeState(
      info: info ?? this.info,
    );
  }

  @override
  List<Object?> get props => [
        info,
      ];
}
