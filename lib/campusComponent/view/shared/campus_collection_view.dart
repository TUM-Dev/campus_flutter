import 'dart:math' as math;

import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// A titled group of cards within a [CampusCollectionView].
class CampusCollectionSection {
  const CampusCollectionSection({
    this.title,
    this.trailing,
    required this.itemCount,
    required this.itemBuilder,
  });

  final String? title;
  final String? trailing;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
}

/// The collection pages share responsive cards and refreshable settled states.
class CampusCollectionView extends StatefulWidget {
  const CampusCollectionView({
    super.key,
    required this.label,
    required this.icon,
    required this.onRefresh,
    required this.hasData,
    this.itemCount = 0,
    this.itemBuilder,
    this.sections,
    this.header,
    this.emptyMessage,
    this.emptyAction,
    required this.minimumCardWidth,
    this.cardAspectRatio,
    this.cardHeight,
    this.error,
    this.stackTrace,
    this.storageKey,
  }) : assert(itemBuilder != null || sections != null);

  final String label;
  final IconData icon;
  final Future<void> Function() onRefresh;
  final bool hasData;
  final int itemCount;
  final IndexedWidgetBuilder? itemBuilder;

  /// Replaces [itemCount] and [itemBuilder] with several titled grids.
  final List<CampusCollectionSection>? sections;

  /// Stays pinned above the cards once data has loaded, e.g. search and
  /// filters.
  final Widget? header;
  final String? emptyMessage;
  final Widget? emptyAction;
  final double minimumCardWidth;

  /// Without [cardAspectRatio] and [cardHeight], each row is as tall as its
  /// tallest card.
  final double? cardAspectRatio;
  final double? cardHeight;
  final Object? error;
  final StackTrace? stackTrace;
  final String? storageKey;

  @override
  State<CampusCollectionView> createState() => _CampusCollectionViewState();
}

class _CampusCollectionViewState extends State<CampusCollectionView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
          final columns = math.max(
            1,
            ((constraints.maxWidth - 20) /
                    (widget.minimumCardWidth * textScale.clamp(1, 1.5) + 12))
                .floor(),
          );
          final cardWidth = math.max(
            0.0,
            (constraints.maxWidth - 32 - (columns - 1) * 12) / columns,
          );
          final sections =
              widget.sections ??
              [
                CampusCollectionSection(
                  itemCount: widget.itemCount,
                  itemBuilder: widget.itemBuilder!,
                ),
              ];
          final isEmpty = sections.every((section) => section.itemCount == 0);
          final aspectRatio = widget.cardAspectRatio;
          return RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: Scrollbar(
              controller: _scrollController,
              child: CustomScrollView(
                controller: _scrollController,
                key: PageStorageKey(widget.storageKey ?? widget.label),
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  if (widget.header != null &&
                      widget.error == null &&
                      widget.hasData)
                    PinnedHeaderSliver(
                      child: ColoredBox(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: widget.header,
                      ),
                    ),
                  if (widget.error != null)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: SizedBox(
                        height: constraints.maxHeight,
                        child: ErrorHandlingRouter(
                          error: widget.error,
                          stackTrace: widget.stackTrace,
                          errorHandlingViewType:
                              ErrorHandlingViewType.fullScreenNoImage,
                          retry: widget.onRefresh,
                        ),
                      ),
                    )
                  else if (!widget.hasData)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: DelayedLoadingIndicator(name: widget.label),
                      ),
                    )
                  else if (isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              widget.icon,
                              size: 48,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              widget.emptyMessage ??
                                  context.tr(
                                    'noEntriesFound',
                                    args: [widget.label],
                                  ),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 16),
                            widget.emptyAction ??
                                TextButton.icon(
                                  onPressed: widget.onRefresh,
                                  icon: const Icon(Icons.refresh),
                                  label: Text(context.tr('refresh')),
                                ),
                          ],
                        ),
                      ),
                    )
                  else
                    for (final (index, section) in sections.indexed)
                      if (section.itemCount > 0) ...[
                        if (section.title != null)
                          SliverToBoxAdapter(
                            child: _SectionHeading(section: section),
                          ),
                        SliverPadding(
                          padding: EdgeInsets.fromLTRB(
                            16,
                            section.title == null ? 16 : 4,
                            16,
                            index == sections.length - 1 ? 16 : 8,
                          ),
                          sliver:
                              aspectRatio == null && widget.cardHeight == null
                              ? SliverList.separated(
                                  itemCount: (section.itemCount / columns)
                                      .ceil(),
                                  separatorBuilder: (context, _) =>
                                      const SizedBox(height: 12),
                                  itemBuilder: (context, row) =>
                                      IntrinsicHeight(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          spacing: 12,
                                          children: [
                                            for (
                                              var item = row * columns;
                                              item < (row + 1) * columns;
                                              item++
                                            )
                                              Expanded(
                                                child: item < section.itemCount
                                                    ? section.itemBuilder(
                                                        context,
                                                        item,
                                                      )
                                                    : const SizedBox(),
                                              ),
                                          ],
                                        ),
                                      ),
                                )
                              : SliverGrid(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: columns,
                                        mainAxisSpacing: 12,
                                        crossAxisSpacing: 12,
                                        mainAxisExtent:
                                            widget.cardHeight ??
                                            (cardWidth / aspectRatio! +
                                                math.max(0, textScale - 1) *
                                                    84),
                                      ),
                                  delegate: SliverChildBuilderDelegate(
                                    section.itemBuilder,
                                    childCount: section.itemCount,
                                  ),
                                ),
                        ),
                      ],
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.section});

  final CampusCollectionSection section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          spacing: 8,
          children: [
            Expanded(
              child: Text(
                section.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium,
              ),
            ),
            if (section.trailing != null)
              Text(
                section.trailing!,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
