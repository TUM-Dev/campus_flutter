import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/movie/movies_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/news/news_widget_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

class CampusScreen extends StatelessWidget {
  const CampusScreen({super.key});

  @override
  Widget build(BuildContext context) => Scrollbar(
    child: SingleChildScrollView(
      key: const PageStorageKey('campus'),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('campusDiscover'),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.tr('campusDiscoverDescription'),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ActionChip(
                          color: WidgetStatePropertyAll(
                            Theme.of(context).cardTheme.color,
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                          labelStyle: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          avatar: const Icon(
                            Icons.newspaper_outlined,
                            size: 18,
                          ),
                          label: Text(context.tr('news')),
                          onPressed: () => context.push(news),
                        ),
                        ActionChip(
                          color: WidgetStatePropertyAll(
                            Theme.of(context).cardTheme.color,
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                          labelStyle: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          avatar: const Icon(
                            Icons.local_movies_outlined,
                            size: 18,
                          ),
                          label: const Text('TU Film'),
                          onPressed: () => context.push(movies),
                        ),
                        ActionChip(
                          color: WidgetStatePropertyAll(
                            Theme.of(context).cardTheme.color,
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                          labelStyle: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          avatar: const Icon(Icons.groups_outlined, size: 18),
                          label: Text(context.tr('campusClubsShortcut')),
                          onPressed: () => context.push(studentClubs),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const NewsWidgetView(),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= 900) {
                    return const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: MovieWidgetView()),
                        Expanded(child: StudentClubWidgetView()),
                      ],
                    );
                  }
                  return const Column(
                    children: [MovieWidgetView(), StudentClubWidgetView()],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
