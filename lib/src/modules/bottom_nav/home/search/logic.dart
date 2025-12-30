import 'package:get/get.dart';

class SearchLogic extends GetxController {
  // 🔹 Reactive list for recent searches
  RxList<String> recentSearches = <String>[].obs;

  /// 🔹 Enter press par call hoga
  void onSearchSubmit(String query) {
    if (query.trim().isEmpty) return;

    // Remove if already exists to avoid duplicates
    recentSearches.remove(query.trim());
    recentSearches.insert(0, query.trim());
  }

  void removeSearch(String value) {
    recentSearches.remove(value);
  }

  void clearAll() {
    recentSearches.clear();
  }
}