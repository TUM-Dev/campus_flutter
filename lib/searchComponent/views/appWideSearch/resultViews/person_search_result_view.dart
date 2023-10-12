import 'package:campus_flutter/personSearchComponent/model/person.dart';
import 'package:campus_flutter/personSearchComponent/viewModel/person_search_viewmodel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonSearchResultView extends ConsumerWidget {
  const PersonSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<PersonSearchViewModel, Person>(
      searchCategory: SearchCategory.persons,
      viewModel: personSearchViewModel,
      body: (person) => ListTile(
        title: Text(person.fullName),
      ),
    );
  }
}
