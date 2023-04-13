import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum DataStatus {
  initial,
  success,
  error,
  inProgress,
}

@immutable
class AppState extends Equatable {
  final DataStatus dataStatus;

  const AppState({
    required this.dataStatus,
  });

  factory AppState.initial() {
    return const AppState(
      dataStatus: DataStatus.initial,
    );
  }

  AppState copyWith({
    DataStatus? dataStatus,
  }) {
    return AppState(
      dataStatus: dataStatus ?? this.dataStatus,
    );
  }

  @override
  List<Object> get props => [
        dataStatus,
      ];
}
