import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_view.dart';
import 'package:campus_flutter/personSearchComponent/model/person.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScaffold extends StatelessWidget {
  const SearchScaffold({super.key, this.isRoomSearch = true});

  final bool isRoomSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(isRoomSearch ? "Room Search" : "Person Search"),
      ),
      body: SearchView(isRoomSearch: isRoomSearch),
    );
  }
}

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key, required this.isRoomSearch});

  final bool isRoomSearch;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _textField(),
        Padding(padding: EdgeInsets.symmetric(vertical: context.halfPadding)),
        _searchBody()
      ],
    );
  }

  Widget _textField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding),
      child: TextField(
        controller: textEditingController,
        onChanged: (searchString) {
          if (widget.isRoomSearch) {
            ref
                .read(navigaTumSearchViewModel)
                .navigaTumSearch(query: searchString);
          } else {
            ref.read(personSearchViewModel).personSearch(query: searchString);
          }
        },
        decoration: InputDecoration(
          hintText: context.localizations.search,
          // TODO: make it work
          suffixIcon: textEditingController.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      textEditingController.clear();
                    });
                  },
                  child: const Icon(Icons.clear),
                )
              : null,
        ),
      ),
    );
  }

  Widget _searchBody() {
    return StreamBuilder(
      stream: widget.isRoomSearch
          ? ref.watch(navigaTumSearchViewModel).searchResults
          : ref.watch(personSearchViewModel).searchResults,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: SingleChildScrollView(
                child: Card(
              child: SeparatedList.list(
                data: snapshot.data!,
                tile: (searchable) {
                  if (widget.isRoomSearch) {
                    final navigaTumEntity =
                        searchable as NavigaTumNavigationEntity;
                    return ListTile(
                      title: Text(navigaTumEntity.getFormattedName()),
                      subtitle: Text(
                        navigaTumEntity.getFormattedSubtext(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavigaTumRoomScaffold(id: navigaTumEntity.id),
                        ),
                      ),
                    );
                  } else {
                    final person = searchable as Person;
                    return ListTile(
                      title: Text(person.fullName),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                    );
                  }
                },
              ),
            )),
          );
        } else if (snapshot.hasError) {
          return Expanded(
            child: ErrorHandlingView(
                error: snapshot.error!,
                errorHandlingViewType: ErrorHandlingViewType.textOnly),
          );
        } else {
          return Expanded(
              child: Center(
            child: Text(context.localizations.enterQueryStart),
          ));
        }
      },
    );
  }
}
