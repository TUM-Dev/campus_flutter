import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/feedbackComponent/viewModels/feedback_viewmodel.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_checkmark_view.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_textfield.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackFormScaffold extends StatelessWidget {
  const FeedbackFormScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Submit Feedback"),
      ),
      body: const FeedbackFormView(),
    );
  }
}

class FeedbackFormView extends ConsumerWidget {
  const FeedbackFormView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Column(
        children: [
          FeedbackTextField(
            title: "Your Email Address",
            textEditingController: ref.read(feedbackViewModel).emailAddress,
          ),
          FeedbackTextField(
            title: "Message",
            textEditingController: ref.read(feedbackViewModel).message,
            expanded: true,
          ),
          Card(
            child: SeparatedList.widgets(
              widgets: [
                FeedbackCheckMarkView(
                  text: "Share your location",
                  isChecked: ref.read(feedbackViewModel).shareLocation,
                ),
                FeedbackCheckMarkView(
                  text: "Share Device's Information",
                  isChecked: ref.read(feedbackViewModel).shareDeviceInfos,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.padding),
            child: ElevatedButton(
              onPressed: () => ref.read(feedbackViewModel).sendFeedBack(),
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
