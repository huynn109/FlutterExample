import 'package:flutternw/redux/app/app_state.dart';
import 'package:flutternw/redux/search/search_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    searchQuery: searchQueryReducer(state.searchQuery, action),
  );
}
