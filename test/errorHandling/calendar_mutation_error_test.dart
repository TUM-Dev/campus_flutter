import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/localized_test_app.dart';

const originalFailure = GrpcError.deadlineExceeded('original request timeout');
final originalStack = StackTrace.fromString('source submission stack');

class _FailedAddition extends CalendarAdditionViewModel {
  _FailedAddition(super.ref) {
    titleController.text = 'Test';
    isValid.add(true);
  }
  @override
  Future<void> saveEvent() async =>
      Error.throwWithStackTrace(originalFailure, originalStack);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });
  testWidgets(
    'calendar save failure keeps the form and shows the original mutation error',
    (tester) async {
      late _FailedAddition model;
      await pumpCard(
        tester,
        ProviderScope(
          overrides: [
            calendarAdditionViewModel(null)
                .overrideWith((ref) => model = _FailedAddition(ref)),
          ],
          child: const SizedBox(
            height: 700,
            child: EventCreationScaffold(calendarEvent: null),
          ),
        ),
      );
      final submit = find.text('submit');
      await tester.ensureVisible(submit);
      await tester.tap(submit);
      await tester.pumpAndSettle();
      final router = tester.widget<ErrorHandlingRouter>(
        find.byType(ErrorHandlingRouter),
      );
      expect(router.error, same(originalFailure));
      expect(router.stackTrace, same(originalStack));
      expect(router.isMutation, isTrue);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(EventCreationScaffold), findsOneWidget);
      expect(tester.takeException(), isNull);
      await model.from.close();
      await model.to.close();
      await model.isValid.close();
      model.titleController.dispose();
      model.annotationController.dispose();
    },
  );
}
