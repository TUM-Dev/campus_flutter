import 'package:campus_flutter/base/routing/routes.dart' as routes;
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/cafeteria_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CafeteriasSearchResultView extends ConsumerWidget {
  const CafeteriasSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<CafeteriaSearchViewModel, Cafeteria>(
      searchCategory: SearchCategory.cafeterias,
      viewModel: cafeteriaSearchViewModel,
      body: (cafeteria) => ListTile(
        title: Text(cafeteria.name),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => context.push(routes.cafeteria, extra: cafeteria),
      ),
    );
  }
}
