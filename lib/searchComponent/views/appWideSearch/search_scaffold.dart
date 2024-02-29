import 'package:campus_flutter/base/helpers/custom_back_button.dart';
import 'package:campus_flutter/searchComponent/viewModels/global_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchScaffold extends ConsumerWidget {
  const SearchScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.search),
        leading: CustomBackButton(
          onPressed: () {
            ref.read(searchViewModel).clear();
            context.pop();
          },
        ),
      ),
      body: SearchView(showContent: true),
    );
  }
}
