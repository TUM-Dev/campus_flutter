import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CafeteriaCardView extends StatelessWidget {
  const CafeteriaCardView({super.key, required this.cafeteria});

  final Cafeteria cafeteria;

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: CafeteriaRowView(
          cafeteria: cafeteria,
        ));
  }
}

class CafeteriaRowView extends ConsumerWidget {
  const CafeteriaRowView({super.key, required this.cafeteria});

  final Cafeteria cafeteria;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        cafeteria.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CafeteriaScaffold(cafeteria: cafeteria))),
    );
  }
}
