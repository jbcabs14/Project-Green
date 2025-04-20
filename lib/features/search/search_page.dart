import 'package:flutter/material.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';
import 'package:proj_hiraya/common/widgets/texts/section_heading.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulating recent searches for UI purposes
    final List<String> recentSearches = [
      'Hello hello hello hello hello',
      'Hello',
      'Hello',
      'Hello',
      'Hello',
      'Hello',
    ]; // Empty list for no recent searches

    return Scaffold(
      appBar: const MainAppBar(
        title: Padding(
          padding: EdgeInsets.only(
              right: MainSizes.sm, top: MainSizes.xl, bottom: MainSizes.xl),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: 'Search...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: recentSearches.isEmpty
            ? const Center(
                child: Text(
                  'No recent searches',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainSectionHeading(
                    title: "Recent Searches",
                    buttonTitle: "Clear all",
                    onPressed: () => MainLoaders.successSnackbar(
                      title: 'Recent Searches',
                      message: 'All recent searches cleared.',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Aligns children to the start
                    children: recentSearches
                        .map((search) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: MainSizes.xs),
                              child: Align(
                                alignment: Alignment
                                    .centerLeft, // Aligns text to the start
                                child: Text(
                                  search,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
      ),
    );
  }
}
