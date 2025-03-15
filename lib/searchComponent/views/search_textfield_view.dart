import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({super.key, required this.searchVM});

  final Provider<SearchViewModel> searchVM;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  bool showIcon = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding),
      child: TextField(
        controller: ref.watch(widget.searchVM).searchTextController,
        onChanged: (searchString) {
          ref.read(widget.searchVM).search();
          setState(() {
            showIcon =
                ref
                    .read(widget.searchVM)
                    .searchTextController
                    .value
                    .text
                    .isNotEmpty;
          });
        },
        decoration: InputDecoration(
          hintText: context.tr("search"),
          suffixIcon:
              showIcon
                  ? GestureDetector(
                    onTap: () {
                      ref.read(widget.searchVM).clear();
                      setState(() {
                        showIcon = false;
                      });
                    },
                    child: const Icon(Icons.clear),
                  )
                  : null,
        ),
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      ),
    );
  }
}
