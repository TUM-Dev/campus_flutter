import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _FailedImages extends Fake implements BaseCacheManager {
  @override
  Stream<FileResponse> getFileStream(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
  }) => Stream.error(StateError('Cover unavailable'));
}

void main() {
  setUp(() {
    CachedNetworkImageProvider.defaultCacheManager = _FailedImages();
  });

  for (final scale in [1.0, 2.0]) {
    testWidgets('compact club cards stay aligned at text scale $scale', (
      tester,
    ) async {
      for (final url in ['', 'https://example.test/cover.png']) {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: MediaQuery(
                data: MediaQueryData(textScaler: TextScaler.linear(scale)),
                child: Builder(
                  builder: (context) => Scaffold(
                    body: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final name in [
                          'HORYZN',
                          'MedTech OneWorld Students',
                        ])
                          SizedBox(
                            width: 180,
                            height: StudentClubCardView.heightFor(context),
                            child: StudentClubCardView(
                              studentClub: StudentClub(
                                name: name,
                                coverUrl: url,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final cards = tester.getSize(find.byType(Card).first);
        expect(tester.getSize(find.byType(Card).last), cards);
        final dividers = find.byType(Divider);
        expect(
          tester.getTopLeft(dividers.first).dy,
          StudentClubCardView.coverHeight,
        );
        expect(
          tester.getTopLeft(dividers.last).dy,
          StudentClubCardView.coverHeight,
        );
        for (final icon in find.byIcon(Icons.groups_outlined).evaluate()) {
          expect(
            tester.getSize(find.byWidget(icon.widget)),
            const Size(32, 32),
          );
        }
        expect(find.byIcon(Icons.groups_outlined), findsNWidgets(2));
        expect(tester.takeException(), isNull);
      }
    });
  }
}
