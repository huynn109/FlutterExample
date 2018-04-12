import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState({
    @required this.searchQuery,
  });

  final String searchQuery;

  factory AppState.initial() {
    return new AppState(
      searchQuery: null,
    );
  }

  AppState copyWith({
    String searchQuery,
  }) {
    return new AppState(
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => searchQuery.hashCode;
}
