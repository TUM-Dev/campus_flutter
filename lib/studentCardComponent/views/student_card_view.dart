import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/views/bar_code_view.dart';
import 'package:campus_flutter/studentCardComponent/views/information_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StudentCardView extends ConsumerWidget {
  const StudentCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(studentCardViewModel).studentCard,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            var data = snapshot.data!.first;
            final lastFetched = ref
                .read(studentCardViewModel)
                .lastFetched
                .value;
            return Column(
              children: [
                _header(lastFetched, context, ref),
                InformationView(studentCard: data),
                if (data.libraryCode ?? data.libraryID case final payload?)
                  BarCodeView(payload: payload),
              ],
            );
          } else {
            return 
              studentCardMessage(context);
          }
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: (() => ref.read(studentCardViewModel).fetch(true)),
          );
        } else {
          return const DelayedLoadingIndicator(name: "StudentCard");
        }
      },
    );
  }

  Widget _header(DateTime? lastFetched, BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: context.padding),
          onPressed: () => ref.read(studentCardViewModel).fetch(true),
          icon: const Icon(Icons.refresh),
        ),
        if (lastFetched != null) Expanded(child: LastUpdatedText(lastFetched)),
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: context.padding),
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

}
Widget studentCardMessage(BuildContext context) {
  final now = DateTime.now();

  // Sommersemester beginnt 01.04., Wintersemester beginnt 01.10.
  final startSummer = DateTime(now.year, 4, 1);
  final startWinter = DateTime(now.year, 10, 1);

  String message;
  String semesterStartDate;

  if (now.isBefore(startSummer)) {
    // Nächstes Semester ist Sommersemester
    semesterStartDate = "01.04.";
    message = context.tr(
      "studentCardUnavailableSummer",
      args: [semesterStartDate],
    );
  } else if (now.isBefore(startWinter)) {
    // Nächstes Semester ist Wintersemester
    semesterStartDate = "01.10.";
    message = context.tr(
      "studentCardUnavailableWinter",
      args: [semesterStartDate],
    );
  } else {
    // Nach 01.10., nächstes Semester ist wieder Sommersemester im nächsten Jahr
    semesterStartDate = "01.04."; // Optional: kann auch Jahr anhängen
    message = context.tr(
      "studentCardUnavailableSummer",
      args: [semesterStartDate],
    );
  }

return Center(
  child: Text(
    message,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge, // larger than bodyMedium
  ),
);
}