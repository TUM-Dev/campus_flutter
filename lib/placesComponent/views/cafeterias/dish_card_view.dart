import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DishCardView extends StatelessWidget {
  const DishCardView({super.key, required this.dish, required this.inverted});

  final (Dish, String) dish;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final String? price = CafeteriasViewModel.formatPrice(dish.$1, context);
    return CardWithPadding(
      color: inverted ? Theme.of(context).colorScheme.surface : null,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dish.$2, style: Theme.of(context).textTheme.titleLarge),
                  const Spacer(),
                  IconButton(
                    onPressed: () => _dishInfoAlert(dish.$1, price, context),
                    icon: Icon(Icons.info_outline, color: context.primaryColor),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerRight,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Expanded(
              flex: 3,
              child: Text(
                dish.$1.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (price != null) Expanded(child: Text(price, maxLines: 1)),
          ],
        ),
      ),
    );
  }

  void _dishInfoAlert(Dish dish, String? price, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(dish.name),
          actionsAlignment: MainAxisAlignment.center,
          scrollable: true,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var label in dish.labels) ...[Text(label)],
              if (price != null) Text(price),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text("Okay"),
            ),
          ],
        );
      },
    );
  }
}
