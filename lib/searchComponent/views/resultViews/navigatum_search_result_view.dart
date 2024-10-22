import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavigaTumSearchResultView extends ConsumerWidget {
  const NavigaTumSearchResultView({super.key, required this.viewModel});

  final Provider<SearchViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<NavigaTumSearchViewModel,
        NavigaTumNavigationEntity>(
      searchCategory: SearchCategory.rooms,
      viewModel: viewModel,
      categoryViewModel: navigaTumSearchViewModel,
      body: (entity) => ListTile(
        title: Text(entity.getFormattedName()),
        subtitle: Text(entity.getFormattedName()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
        onTap: () => context.push(navigaTum, extra: entity.id),
      ),
    );
  }
}
