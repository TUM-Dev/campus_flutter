import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_checkmark_view.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_textfield.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackFormScaffold extends ConsumerWidget {
  const FeedbackFormScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            ref.read(feedbackViewModel).clearForm();
          },
        ),
        title: Text(context.localizations.submitFeedback),
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
            title: context.localizations.yourEmailAddress,
            textEditingController: ref.read(feedbackViewModel).emailAddress,
            validInput: ref.watch(feedbackViewModel).validEmail,
            onChanged: (text) =>
                ref.read(feedbackViewModel).checkEmailValidity(),
            invalidMessage: context.localizations.invalidEmail,
            decorationMessage: context.localizations.yourEmail,
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
                FeedbackCheckMarkView(
                  text: context.localizations.shareDeviceInformation,
                  isChecked: ref.read(feedbackViewModel).shareDeviceInfos,
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
                      ? () => ref.read(feedbackViewModel).sendFeedBack()
                      : null,
                  child: Text(context.localizations.submit),
                ),
              );
            },
          ),
          StreamBuilder(
            stream: ref.watch(feedbackViewModel).successfullySent,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  context.localizations.successfullySent,
                  style: context.theme.textTheme.bodyLarge
                      ?.copyWith(color: Colors.green),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(
                      context.localizations.unableToSend,
                      style: context.theme.textTheme.bodyLarge
                          ?.copyWith(color: Colors.redAccent),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.halfPadding,
                      ),
                    ),
                    ErrorHandlingView(
                      error: snapshot.error!,
                      errorHandlingViewType:
                          ErrorHandlingViewType.descriptionOnly,
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
