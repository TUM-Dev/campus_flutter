import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScaffold extends ConsumerStatefulWidget {
  const SearchScaffold({super.key, required this.searchVM, this.searchString});

  final Provider<SearchViewModel> searchVM;
  final String? searchString;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScaffoldState();
}

class _SearchScaffoldState extends ConsumerState<SearchScaffold> {
  @override
  void initState() {
    ref.read(widget.searchVM).search(searchString: widget.searchString);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr("search")),
        leading: CustomBackButton(
          beforeOnPressed: ref.read(widget.searchVM).clear,
        ),
      ),
      body: SearchView(searchVM: widget.searchVM),
    );
  }
}
