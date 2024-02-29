import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:flutter/material.dart';

class SearchResultDetailsScaffold<S extends Searchable>
    extends StatelessWidget {
  const SearchResultDetailsScaffold({
    super.key,
    required this.searchCategory,
    required this.data,
    required this.body,
  });

  final SearchCategory searchCategory;
  final List<S> data;
  final Widget Function(S searchable) body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          SearchCategoryExtension.localizedEnumTitle(searchCategory, context),
        ),
      ),
      body: SearchResultDetailsView(
        data: data,
        body: body,
      ),
    );
  }
}

class SearchResultDetailsView<S extends Searchable> extends StatelessWidget {
  const SearchResultDetailsView({
    super.key,
    required this.data,
    required this.body,
  });

  final List<S> data;
  final Widget Function(S searchable) body;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: context.padding * 2),
        child: Card(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) => body(data[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const PaddedDivider(height: 0),
          ),
        ),
      ),
    );
  }
}
