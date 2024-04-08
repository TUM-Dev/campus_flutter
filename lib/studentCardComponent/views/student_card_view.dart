import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/views/bar_code_view.dart';
import 'package:campus_flutter/studentCardComponent/views/information_view.dart';
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
            final lastFetched =
                ref.read(studentCardViewModel).lastFetched.value;
            return Column(
              children: [
                _header(lastFetched, context, ref),
                _warningCard(context),
                InformationView(studentCard: data),
                BarCodeView(libraryID: data.libraryID),
              ],
            );
          } else {
            return Center(
              child: Text(
                context.localizations.noEntriesFound(
                  "StudentCard",
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(studentCardViewModel).fetch,
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

  Widget _warningCard(BuildContext context) {
    return CardWithPadding(
      elevation: 0,
      color: context.primaryColor.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning, color: context.primaryColor),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Expanded(
            child: Text(
              context.localizations.currentlyInBeta,
              style: TextStyle(color: context.primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
