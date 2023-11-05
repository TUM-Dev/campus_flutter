import 'package:campus_flutter/providers_get_it.dart';
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
        leading: const BackButton(),
      ),
      body: SearchView(showContent: true),
    );
  }
}
