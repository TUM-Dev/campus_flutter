import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/studentCardComponent/views/information_view.dart';
import 'package:campus_flutter/studentCardComponent/views/snapping_slider.dart';
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
              SnappingSlider(libraryID: data.libraryID),
            ],
          );
        } else if (snapshot.hasError) {
          return ErrorHandlingView(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(studentCardViewModel).fetch,
          );
        } else {
          return const DelayedLoadingIndicator(name: "Student Card");
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
              "Currently in Beta With Limited Functionality!",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
