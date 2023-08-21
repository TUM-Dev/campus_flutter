import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/helpers/tapable.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampusCardView extends ConsumerWidget {
  const CampusCardView({super.key, required this.campus});

  final Campus campus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tapable(
        child: AspectRatio(
            aspectRatio: 1.75,
            child: Card(
                child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: SizedBox.expand(
                        child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            child: Image.asset(
                              campus.image ?? "",
                              fit: BoxFit.cover,
                            )))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              campus.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.place,
                                  color: Theme.of(context).primaryColor,
                                ))
                          ],
                        )))
              ],
            ))),
        action: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CampusScaffold(campus: campus)));
        });
  }
}
