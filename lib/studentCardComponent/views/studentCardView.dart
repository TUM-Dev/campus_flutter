import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/studentCardComponent/model/studentCard.dart';
import 'package:campus_flutter/studentCardComponent/views/barCodeView.dart';
import 'package:campus_flutter/studentCardComponent/views/informationView.dart';
import 'package:campus_flutter/studentCardComponent/views/snappingSlider.dart';
import 'package:campus_flutter/studentCardComponent/views/verficationCodeView.dart';
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
            final lastFetched =
                ref.read(studentCardViewModel).lastFetched.value;
            return RefreshIndicator(
                onRefresh: () => ref.read(studentCardViewModel).fetch(true),
                child: Column(
                  children: [
                    if (lastFetched != null) LastUpdatedText(lastFetched),
                    _warningCard(),
                    InformationView(studentCard: data),
                    SnappingSlider(libraryID: data.libraryID),
                    //const VerificationCodeView(),
                    //BarCodeView(libraryID: data.libraryID),
                  ],
                ));
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
                error: snapshot.error!,
                errorHandlingViewType: ErrorHandlingViewType.fullScreen,
                retry: ref.read(studentCardViewModel).fetch);
          } else {
            return const DelayedLoadingIndicator(name: "Student Card");
          }
        });
  }

  Widget _warningCard() {
    return CardWithPadding(
        color: Colors.redAccent.withOpacity(0.2),
        child:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.warning, color: Colors.red),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Expanded(
              child: Text("Does NOT Replace the Physical StudentCard!",
                  style: TextStyle(color: Colors.red)))
        ]));
  }
}
