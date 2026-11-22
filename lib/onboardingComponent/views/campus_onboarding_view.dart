import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/providers/default_campus_provider.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/views/default_campus_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

/// Asks the user for their default campus. Shown at the end of onboarding and
/// once to existing users who have not made a choice yet.
class CampusOnboardingView extends ConsumerWidget {
  const CampusOnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selected = ref.watch(defaultCampusProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('defaultCampus'))),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.padding,
                          vertical: context.halfPadding,
                        ),
                        child: Text(
                          context.tr('defaultCampusDescription'),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      DefaultCampusOptions(
                        selected: selected,
                        onSelected: (campus) => ref
                            .read(defaultCampusProvider.notifier)
                            .select(campus),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(context.padding),
                  child: ElevatedButton(
                    onPressed: () {
                      // Persist the shown choice so we don't ask again, even
                      // if the user keeps the preselected option.
                      ref.read(defaultCampusProvider.notifier).select(selected);
                      ref
                          .read(onboardingViewModel)
                          .finishOnboarding(ref, context);
                    },
                    child: Text(context.tr('continueOnboarding')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
