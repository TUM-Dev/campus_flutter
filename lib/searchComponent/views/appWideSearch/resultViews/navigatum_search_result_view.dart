import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigaTumSearchResultView extends ConsumerWidget {
  const NavigaTumSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<NavigaTumSearchViewModel,
        NavigaTumNavigationEntity>(
      searchCategory: SearchCategory.rooms,
      viewModel: navigaTumSearchViewModel,
      body: (entity) => ListTile(
        title: Text(entity.getFormattedName()),
        subtitle: Text(entity.getFormattedName()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavigaTumRoomScaffold(id: entity.id),
          ),
        ),
      ),
    );
  }
}
