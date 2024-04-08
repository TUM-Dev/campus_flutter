import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/feedbackComponent/viewModels/feedback_viewmodel.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_checkmark_view.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedbackFormScaffold extends ConsumerWidget {
  const FeedbackFormScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            context.pop();
            ref.read(feedbackViewModel).clearForm();
          },
        ),
        title: Text(context.localizations.submitFeedback),
      ),
      body: const FeedbackFormView(),
    );
  }
}

class FeedbackFormView extends ConsumerStatefulWidget {
  const FeedbackFormView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeedbackFormViewState();
}

class _FeedbackFormViewState extends ConsumerState<FeedbackFormView> {
  @override
  void initState() {
    ref.read(feedbackViewModel).initForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            FeedbackTextField(
              title: context.localizations.name,
              textEditingController: ref.read(feedbackViewModel).name,
              validInput: ref.watch(feedbackViewModel).validName,
              onChanged: (text) =>
                  ref.read(feedbackViewModel).checkNameValidity(),
              invalidMessage: context.localizations.invalidName,
              decorationMessage: context.localizations.yourName,
            ),
            FeedbackTextField(
              title: context.localizations.message,
              textEditingController: ref.read(feedbackViewModel).message,
              validInput: ref.watch(feedbackViewModel).validMessage,
              onChanged: (text) =>
                  ref.read(feedbackViewModel).checkMessageValidity(),
              invalidMessage: context.localizations.invalidMessage,
              decorationMessage: context.localizations.yourMessage,
              expanded: true,
            ),
            Card(
              child: SeparatedList.widgets(
                widgets: [
                  FeedbackCheckMarkView(
                    text: context.localizations.shareLocation,
                    isChecked: ref.read(feedbackViewModel).shareLocation,
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: ref.watch(feedbackViewModel).activeButton,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.all(context.padding),
                  child: ElevatedButton(
                    onPressed: (snapshot.data != null && snapshot.data!)
                        ? () =>
                            ref.read(feedbackViewModel).sendFeedBack(context)
                        : null,
                    child: Text(context.localizations.submit),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
