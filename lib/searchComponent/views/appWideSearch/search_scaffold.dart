import 'package:campus_flutter/searchComponent/views/appWideSearch/search_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';

class SearchScaffold extends StatelessWidget {
  const SearchScaffold({super.key, required this.selectedPage});

  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.search),
        leading: const BackButton(),
      ),
      body: SearchView(index: selectedPage, showContent: true),
    );
  }
}
