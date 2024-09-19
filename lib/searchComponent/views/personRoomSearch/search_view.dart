import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/personComponent/model/personSearch/person.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/person_search_viewmodel.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PersonRoomSearchScaffold extends ConsumerWidget {
  const PersonRoomSearchScaffold({
    super.key,
    this.searchString,
    this.isRoomSearch = true,
  });

  final bool isRoomSearch;
  final String? searchString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            context.canPop() ? context.pop() : context.go(search);
            if (isRoomSearch) {
              ref.read(navigaTumSearchViewModel).searchResults.add([]);
            } else {
              ref.read(personSearchViewModel).searchResults.add([]);
            }
          },
        ),
        title: Text(
          isRoomSearch ? context.tr("roomSearch") : context.tr("personSearch"),
        ),
      ),
      body: PersonRoomSearchView(
        searchString: searchString,
        isRoomSearch: isRoomSearch,
      ),
    );
  }
}

class PersonRoomSearchView extends ConsumerStatefulWidget {
  const PersonRoomSearchView({
    super.key,
    this.searchString,
    required this.isRoomSearch,
  });

  final bool isRoomSearch;
  final String? searchString;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<PersonRoomSearchView> {
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
        _searchBody(),
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
          hintText: context.tr("search"),
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
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
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
                        onTap: () =>
                            context.push(navigaTum, extra: navigaTumEntity.id),
                      );
                    } else {
                      final person = searchable as Person;
                      return ListTile(
                        title: Text(person.fullNameWithTitle),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                        onTap: () => context.push(
                          personDetails,
                          extra: person.obfuscatedID,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Expanded(
            child: ErrorHandlingRouter(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.textOnly,
            ),
          );
        } else {
          if (widget.searchString != null) {
            return Expanded(
              child: Center(
                child: DelayedLoadingIndicator(
                  name: widget.isRoomSearch
                      ? context.tr("rooms")
                      : context.tr("persons"),
                ),
              ),
            );
          } else {
            return Expanded(
              child: Center(
                child: Text(context.tr("enterQueryStart")),
              ),
            );
          }
        }
      },
    );
  }
}
