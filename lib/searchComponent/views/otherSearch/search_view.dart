import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_view.dart';
import 'package:campus_flutter/personDetailedComponent/views/person_details_view.dart';
import 'package:campus_flutter/personSearchComponent/model/person.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScaffold extends ConsumerWidget {
  const SearchScaffold(
      {super.key, this.searchString, this.isRoomSearch = true});

  final bool isRoomSearch;
  final String? searchString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            if (isRoomSearch) {
              ref.read(navigaTumSearchViewModel).searchResults.add([]);
            } else {
              ref.read(personSearchViewModel).searchResults.add([]);
            }
          },
        ),
        title: Text(isRoomSearch ? "Room Search" : "Person Search"),
      ),
      body: SearchView(searchString: searchString, isRoomSearch: isRoomSearch),
    );
  }
}

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key, this.searchString, required this.isRoomSearch});

  final bool isRoomSearch;
  final String? searchString;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final TextEditingController textEditingController = TextEditingController();

  bool showClearButton = false;

  @override
  void initState() {
    if (widget.searchString != null) {
      if (widget.isRoomSearch) {
        ref
            .read(navigaTumSearchViewModel)
            .navigaTumSearch(query: widget.searchString!);
      } else {
        ref
            .read(personSearchViewModel)
            .personSearch(query: widget.searchString!);
      }
      setState(() {
        textEditingController.text = widget.searchString!;
      });
    }
    super.initState();
  }

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
          setState(() {
            showClearButton = searchString.isNotEmpty;
          });
          if (widget.isRoomSearch) {
            if (searchString.isNotEmpty) {
              ref
                  .read(navigaTumSearchViewModel)
                  .navigaTumSearch(query: searchString);
            } else {
              ref.read(navigaTumSearchViewModel).searchResults.add(null);
            }
          } else {
            if (searchString.isNotEmpty) {
              ref.read(personSearchViewModel).personSearch(query: searchString);
            } else {
              ref.read(navigaTumSearchViewModel).searchResults.add(null);
            }
          }
        },
        decoration: InputDecoration(
          hintText: context.localizations.search,
          suffixIcon: showClearButton
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      textEditingController.text = "";
                      showClearButton = false;
                    });
                    if (widget.isRoomSearch) {
                      ref
                          .read(navigaTumSearchViewModel)
                          .searchResults
                          .add(null);
                    } else {
                      ref
                          .read(navigaTumSearchViewModel)
                          .searchResults
                          .add(null);
                    }
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
                      title: Text(person.fullNameWithTitle),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonDetailsScaffold(
                            obfuscatedId: person.obfuscatedID,
                          ),
                        ),
                      ),
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
          if (widget.searchString != null) {
            return Expanded(
              child: Center(
                child: DelayedLoadingIndicator(
                  name: widget.isRoomSearch
                      ? context.localizations.rooms
                      : context.localizations.persons,
                ),
              ),
            );
          } else {
            return Expanded(
                child: Center(
              child: Text(context.localizations.enterQueryStart),
            ));
          }
        }
      },
    );
  }
}
