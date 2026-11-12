import 'dart:math' as math;

import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

/// The collection pages share responsive cards and refreshable settled states.
class CampusCollectionView extends StatefulWidget {
  const CampusCollectionView({
    super.key,
    required this.label,
    required this.icon,
    required this.onRefresh,
    required this.hasData,
    required this.itemCount,
    required this.itemBuilder,
    required this.minimumCardWidth,
    required this.cardAspectRatio,
    this.cardHeight,
    this.error,
    this.stackTrace,
    this.storageKey,
  });

  final String label;
  final IconData icon;
  final Future<void> Function() onRefresh;
  final bool hasData;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double minimumCardWidth;
  final double cardAspectRatio;
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
          return RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: Scrollbar(
              controller: _scrollController,
              child: CustomScrollView(
                controller: _scrollController,
                key: PageStorageKey(widget.storageKey ?? widget.label),
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
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
                  else if (widget.itemCount == 0)
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
                              context.tr(
                                'noEntriesFound',
                                args: [widget.label],
                              ),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 16),
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
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          mainAxisExtent:
                              widget.cardHeight ??
                              (cardWidth / widget.cardAspectRatio +
                                  math.max(0, textScale - 1) * 84),
                        ),
                        delegate: SliverChildBuilderDelegate(
                          widget.itemBuilder,
                          childCount: widget.itemCount,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
