import 'package:flutter/material.dart';
class SearchListViewResults extends StatelessWidget {
  const SearchListViewResults({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
             // child: BookListViewItem()
             child: Text(''),
             );
        });
  }
}
