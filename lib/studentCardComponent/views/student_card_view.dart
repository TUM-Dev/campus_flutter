import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/views/information_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentCardView extends ConsumerWidget {
  const StudentCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(studentCardViewModel).studentCard,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          final lastFetched = ref.read(studentCardViewModel).lastFetched.value;
          return Column(
            children: [
              if (lastFetched != null) LastUpdatedText(lastFetched),
              _warningCard(context),
              InformationView(studentCard: data),
            ],
          );
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

  Widget _warningCard(BuildContext context) {
    return CardWithPadding(
      elevation: 0,
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning, color: Theme.of(context).primaryColor),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Expanded(
            child: Text(
              context.localizations.currentlyInBeta,
              style: TextStyle(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
