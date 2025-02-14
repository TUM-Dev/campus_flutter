import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:flutter/material.dart';

class PreferenceSelectionView<T> extends StatelessWidget {
  const PreferenceSelectionView({
    super.key,
    required this.data,
    required this.entry,
  });

  final List<ListTile> data;
  final String entry;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: context.padding * 2),
        child: Card(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => data[index],
            separatorBuilder:
                (context, index) => const PaddedDivider(height: 0),
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}
