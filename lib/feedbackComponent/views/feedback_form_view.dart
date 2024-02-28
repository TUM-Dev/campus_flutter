import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
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
        leading: BackButton(
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
                      ?.copyWith(color: context.theme.primaryColor),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(
                      context.localizations.unableToSend,
                      style: context.theme.textTheme.bodyLarge
                          ?.copyWith(color: context.theme.primaryColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.halfPadding,
                      ),
                    ),
                    ErrorHandlingRouter(
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
