import 'dart:convert';
import 'dart:io';

import 'package:campus_flutter/base/enums/search_type.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_scaffold.dart';
import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('prefills search and applies a second link to the same screen', (
    tester,
  ) async {
    late _RecordingSearch model;
    final provider = Provider<SearchViewModel>((ref) {
      model = _RecordingSearch(ref);
      return model;
    });

    Future<void> openQuery(String query) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            localizationsDelegates: const [_LocalizationDelegate()],
            home: SearchScaffold(searchVM: provider, searchString: query),
          ),
        ),
      );
      await tester.pump();
    }

    await openQuery('5602.EG.001');
    final state = tester.state(find.byType(SearchScaffold));
    expect(find.widgetWithText(TextField, '5602.EG.001'), findsOneWidget);
    expect(model.queries, ['5602.EG.001']);

    await openQuery('0101.01.101');
    expect(tester.state(find.byType(SearchScaffold)), same(state));
    expect(find.widgetWithText(TextField, '0101.01.101'), findsOneWidget);
    expect(model.queries, ['5602.EG.001', '0101.01.101']);

    await openQuery('0101.01.101');
    expect(model.queries, ['5602.EG.001', '0101.01.101']);
  });
}

class _RecordingSearch extends SearchViewModel {
  _RecordingSearch(super.ref) : super(searchType: SearchType.room);
  final queries = <String?>[];

  @override
  void search({String? searchString}) {
    queries.add(searchString);
    if (searchString != null) searchTextController.text = searchString;
  }
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<Localization> load(Locale locale) {
    Localization.load(
      locale,
      translations: Translations(
        jsonDecode(File('assets/translations/en.json').readAsStringSync())
            as Map<String, dynamic>,
      ),
    );
    return SynchronousFuture(Localization.instance);
  }

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
