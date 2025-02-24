import 'package:flutter/material.dart';
import 'package:untitled/Features/search/presntation/widgets/search_list_view_results.dart';
import '../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text('Search Results', style: Styles.textStyle18),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchListViewResults())
        ],
      ),
    );
  }
}
