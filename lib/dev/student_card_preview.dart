// Run with: flutter run -t lib/dev/student_card_preview.dart
// Debug-only synthetic preview. Does not read or write the real card cache.
import 'dart:convert';

import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:campus_flutter/studentCardComponent/views/information_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kDebugMode) {
    runApp(const MaterialApp(home: Scaffold(body: Text('Debug preview only'))));
    return;
  }
  await EasyLocalization.ensureInitialized();
  final image = await rootBundle.load(
    'assets/images/placeholders/portrait_placeholder.png',
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: _Preview(image: base64Encode(image.buffer.asUint8List())),
        ),
      ),
    ),
  );
}

class _Preview extends StatefulWidget {
  const _Preview({required this.image});
  final String image;

  @override
  State<_Preview> createState() => _PreviewState();
}

class _PreviewState extends State<_Preview> {
  StudentCardValidity _scenario = StudentCardValidity.expired;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final (start, end) = switch (_scenario) {
      StudentCardValidity.current => (
        now.subtract(const Duration(days: 1)),
        now.add(const Duration(days: 30)),
      ),
      StudentCardValidity.expired => (
        now.subtract(const Duration(days: 30)),
        now.subtract(const Duration(days: 1)),
      ),
      StudentCardValidity.notYetValid => (
        now.add(const Duration(days: 1)),
        now.add(const Duration(days: 30)),
      ),
      StudentCardValidity.invalid => (
        now.add(const Duration(days: 30)),
        now.subtract(const Duration(days: 1)),
      ),
    };
    final card = StudentCard(
      id: 'PREVIEW',
      name: 'DEMO — NOT AN ID',
      birthday: DateTime(2000),
      studyID: 'DEMO',
      chipID: 'DEMO',
      semester: '26W',
      validFrom: start,
      validUntil: end,
      studies: [],
      image: widget.image,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Student card · DEBUG PREVIEW')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Synthetic data · not valid identification',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          DropdownButton<StudentCardValidity>(
            value: _scenario,
            isExpanded: true,
            items: StudentCardValidity.values
                .map(
                  (value) =>
                      DropdownMenuItem(value: value, child: Text(value.name)),
                )
                .toList(),
            onChanged: (value) => setState(() => _scenario = value!),
          ),
          InformationView(studentCard: card),
        ],
      ),
    );
  }
}
