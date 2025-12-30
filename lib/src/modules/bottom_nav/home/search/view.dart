import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class AppSearchDelegate extends SearchDelegate<String> {
  final SearchLogic logic = Get.put(SearchLogic());

  @override
  String get searchFieldLabel => 'Search';
   @override
  TextStyle get searchFieldStyle =>
      const TextStyle(fontSize: 14, color: Colors.black);

  /// 🌈 APP BAR THEME (Rounded search bar)
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.black.withOpacity(0.04),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // ⭕ rounded
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// 🔍 LEFT ICON (Search)
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => close(context, ''),
    );
  }

  /// 📷 RIGHT ICON (Scan)
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
        onPressed: () {
          // TODO: Scan action
        },
      ),
    ];
  }

  /// 🔎 SEARCH RESULT
  @override
  Widget buildResults(BuildContext context) {
    logic.onSearchSubmit(query);

    return Center(
      child: Text(
        'Result for "$query"',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  /// 🕒 LAST SEARCHES
  @override
  Widget buildSuggestions(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Last search',
                 style: StyleRefer.robotoRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
                ),
                GestureDetector(
                  onTap: logic.clearAll,
                  child:  Text(
                    'Clear all',
                   style: StyleRefer.robotoRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.redColor,
                  fontWeight: FontWeight.w400,
                ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// List
            Expanded(
              child: logic.recentSearches.isEmpty
                  ? const Center(child: Text('No recent search'))
                  : ListView.builder(
                      itemCount: logic.recentSearches.length,
                      itemBuilder: (context, index) {
                        final item = logic.recentSearches[index];
                        return ListTile(
                          leading: const Icon(Icons.history,color:  AppColors.lastSearch,),
                          title: Text(item, style: StyleRefer.robotoRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.lastSearch,
                  fontWeight: FontWeight.w400,
                ),),
                          trailing: IconButton(
                            icon: const Icon(Icons.close, size: 18,color:  AppColors.lastSearch,),
                            onPressed: () => logic.removeSearch(item),
                          ),
                          onTap: () {
                            query = item;
                            showResults(context);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      );
    });
  }

  /// ⌨ ENTER PRESS HANDLER
  @override
  void showResults(BuildContext context) {
    logic.onSearchSubmit(query);
    super.showResults(context);
  }
}
