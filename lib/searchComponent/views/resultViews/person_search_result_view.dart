import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/personComponent/model/personSearch/person.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/person_search_viewmodel.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PersonSearchResultView extends ConsumerWidget {
  const PersonSearchResultView({super.key, required this.viewModel});

  final Provider<SearchViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<PersonSearchViewModel, Person>(
      searchCategory: SearchCategory.persons,
      searchVM: viewModel,
      searchCategoryVM: personSearchViewModel,
      body: (person) => ListTile(
        title: Text(person.fullNameWithTitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => context.push(personDetails, extra: person.obfuscatedID),
      ),
    );
  }
}
