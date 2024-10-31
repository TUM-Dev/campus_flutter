import 'package:campus_flutter/base/enums/search_type.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScaffold extends ConsumerWidget {
  const SearchScaffold({super.key, required this.searchVM});

  final Provider<SearchViewModel> searchVM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr("search")),
        leading: CustomBackButton(
          beforeOnPressed: (searchVM.argument as (SearchType, String?)).$1 ==
                  SearchType.general
              ? ref.read(searchVM).clear
              : null,
        ),
      ),
      body: SearchView(searchVM: searchVM, showContent: true),
    );
  }
}
