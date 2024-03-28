import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LinkView extends ConsumerWidget {
  const LinkView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              right: context.halfPadding,
              top: context.halfPadding,
              bottom: context.halfPadding,
              left: context.padding,
            ),
            child: ListTile(
              leading: const Icon(Icons.school),
              title: Center(
                child: AutoSizeText(
                  context.localizations.studyRooms,
                  maxLines: 1,
                ),
              ),
              onTap: () => context.push(studyRooms),
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              right: context.padding,
              top: context.halfPadding,
              bottom: context.halfPadding,
              left: context.halfPadding,
            ),
            child: ListTile(
              leading: const Icon(Icons.restaurant),
              title: Center(
                child: AutoSizeText(
                  context.localizations.cafeterias,
                  maxLines: 1,
                ),
              ),
              onTap: () => context.push(cafeterias),
            ),
          ),
        ),
      ],
    );
  }
}
