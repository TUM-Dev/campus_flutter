import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField(
      {super.key, required this.textEditingController, required this.index});

  final TextEditingController textEditingController;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  bool showIcon = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        child: TextField(
          controller: widget.textEditingController,
          onChanged: (searchString) {
            ref
                .read(searchViewModel)
                .triggerSearchAfterUpdate(searchString, widget.index);
            setState(() {
              showIcon = widget.textEditingController.value.text.isNotEmpty;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: showIcon
                ? GestureDetector(
                    onTap: () {
                      ref.read(searchViewModel).clear();
                      widget.textEditingController.clear();
                      setState(() {
                        showIcon = false;
                      });
                    },
                    child: const Icon(Icons.clear),
                  )
                : null,
          ),
        ));
  }
}
