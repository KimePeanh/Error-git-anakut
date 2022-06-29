import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/features/home/repository/search/search_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  String query = "";
  int searchPageIndex = 0;
  List<ShopModel> results = [];
  SearchRepository _searchRepository = SearchRepository();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchStarted) {
      try {
        results.clear();
        if (event.query != query) {
          query = event.query;
          searchPageIndex = 1;
          yield Searching();
        } else {
          yield Searching(isInitiallySearch: false);
          searchPageIndex++;
        }
        List<ShopModel> tempResults = await _searchRepository.SearchShop(
            item: searchPageIndex, query: event.query);
        results.addAll(tempResults);

        yield Searched();
      } catch (e) {
        yield ErrorSearching(error: e.toString());
      }
    }
  }
}
