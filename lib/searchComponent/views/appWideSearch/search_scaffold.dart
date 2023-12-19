import 'package:campus_flutter/navigation.dart';
import 'package:campus_flutter/searchComponent/viewmodels/global_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScaffold extends ConsumerStatefulWidget {
  const SearchScaffold({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScaffoldState();
}

class _SearchScaffoldState extends ConsumerState<SearchScaffold> {
  @override
  void initState() {
    ref.read(searchViewModel).setSearchCategories(ref.read(currentIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.search),
        leading: BackButton(
          onPressed: () {
            ref.read(searchViewModel).clear();
            Navigator.pop(context);
          },
        ),
      ),
      body: SearchView(showContent: true),
    );
  }
}
