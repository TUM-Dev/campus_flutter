import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CampusCardView extends ConsumerWidget {
  const CampusCardView({super.key, required this.campus, this.margin});

  final Campus campus;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: AspectRatio(
        aspectRatio: 1.75,
        child: Card(
          margin: margin,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox.expand(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.asset(campus.image ?? "", fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.padding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        campus.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: context.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.place, color: context.primaryColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => context.push(routes.place, extra: campus),
    );
  }
}
