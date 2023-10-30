import 'dart:async';

import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/searchComponent/model/vocab.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:campus_flutter/base/placeholders/tflite_placeholder.dart'
    if (dart.library.io) 'package:tflite_flutter/tflite_flutter.dart';

class GlobalSearchViewModel {
  BehaviorSubject<List<SearchCategory>?> result = BehaviorSubject.seeded(null);
  BehaviorSubject<List<SearchCategory>> selectedCategories =
      BehaviorSubject.seeded([]);

  String searchString = "";
  int index = 0;
  final Ref ref;

  late Interpreter interpreter;

  GlobalSearchViewModel(this.ref) {
    if (!kIsWeb) {
      initializeNaturalLanguageModel();
    }
  }

  Future initializeNaturalLanguageModel() async {
    interpreter =
        await Interpreter.fromAsset('assets/models/english_bert_30.tflite');
  }

  void search(int index, String searchString) async {
    if (searchString.isEmpty) {
      clear();
      return;
    }
    this.index = index;
    this.searchString = searchString;
    if (selectedCategories.value.isEmpty) {
      if (!kIsWeb) {
        _textClassificationModel(searchString);
      } else {
        _webSearch(searchString);
      }
    } else {
      result.add(selectedCategories.value);
    }
  }

  void _webSearch(String searchString) async {
    if (ref.read(loginViewModel).credentials.value == Credentials.tumId) {
      result.add(SearchCategory.values);
    } else {
      result.add(SearchCategoryExtension.unAuthorizedSearch());
    }
  }

  Future<void> _textClassificationModel(String searchString) async {
    final tokens = await tokenizeBert(searchString);
    var output = List.filled(1 * 6, 0).reshape([1, 6]);
    interpreter.run(tokens, output);
    final probabilities = output.first as List<double>;
    final List<String> categoryNames = [
      "cafeterias",
      "calendar",
      "grade",
      "movie",
      "news",
      "studyroom"
    ];
    final categories = Map.fromIterables(categoryNames, probabilities);
    if (ref.read(loginViewModel).credentials.value != Credentials.tumId) {
      categories.removeWhere((key, value) => ["calendar, grade"].contains(key));
    }
    List<MapEntry<String, double>> sortedEntries = categories.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final sortedCategories = Map.fromEntries(sortedEntries)
        .keys
        .map((key) => SearchCategory.fromString(key))
        .toList();

    /// if authenticated add lecture and person search
    if (ref.read(loginViewModel).credentials.value == Credentials.tumId) {
      sortedCategories
          .addAll([SearchCategory.lectures, SearchCategory.persons]);
    }
    result.add(sortedCategories);
  }

  Future<List<int>> tokenizeBert(String input) async {
    List<String> substrings = input.split(" ");
    List<int> tokenized = [];

    for (var string in substrings) {
      if (vocab.containsKey(string)) {
        tokenized.add(vocab[string]!);
      } else {
        int start = 0;
        while (start < string.length) {
          int length = string.length;
          while (length >= start) {
            String tempString = string.substring(start, length);
            if (vocab.containsKey(tempString)) {
              tokenized.add(vocab[tempString]!);
              start = length;
              break;
            }
            length--;
          }
          if (start != length) {
            tokenized.add(vocab["[UNK]"]!);
            start = string.length;
          }
        }
      }
    }

    int paddingNeeded = 30 - tokenized.length;
    if (paddingNeeded > 0) {
      tokenized.addAll(List<int>.filled(paddingNeeded, 0));
    } else if (paddingNeeded < 0) {
      tokenized = tokenized.sublist(0, 30);
    }

    return tokenized;
  }

  void updateCategory(SearchCategory searchCategory) {
    final categories = selectedCategories.value;
    if (selectedCategories.value.contains(searchCategory)) {
      categories.remove(searchCategory);
    } else {
      categories.add(searchCategory);
    }
    selectedCategories.add(categories);
  }

  void clear() {
    searchString = "";
    result.add(null);
  }

  void triggerSearchAfterUpdate(String? searchString, int? index) {
    if (index != null && searchString != null) {
      this.index = index;
      this.searchString = searchString;
    }
    search(this.index, this.searchString);
    if (selectedCategories.value.isEmpty) {
      for (var category in SearchCategory.values) {
        _searchTriggerBuilder(searchString, category);
      }
    } else {
      for (var selectedCategory in selectedCategories.value) {
        _searchTriggerBuilder(searchString, selectedCategory);
      }
    }
  }

  void setSearchCategories(int index) {
    final authorized =
        ref.read(loginViewModel).credentials.value == Credentials.tumId;
    switch (index) {
      case 1:
        if (authorized) {
          selectedCategories.add([SearchCategory.grade]);
        } else {
          selectedCategories.add([]);
        }
      case 2:
        if (authorized) {
          selectedCategories
              .add([SearchCategory.personalLectures, SearchCategory.lectures]);
        } else {
          selectedCategories.add([]);
        }
      case 3:
        if (authorized) {
          selectedCategories.add([
            SearchCategory.calendar,
          ]);
        } else {
          selectedCategories.add([]);
        }
      case 4:
        selectedCategories.add([
          SearchCategory.studyRoom,
          SearchCategory.cafeterias,
          SearchCategory.rooms
        ]);
      default:
        selectedCategories.add([]);
    }
  }

  void _searchTriggerBuilder(
      String? searchString, SearchCategory searchCategory) {
    switch (searchCategory) {
      case SearchCategory.grade:
        ref.read(gradesSearchViewModel).gradesSearch(query: this.searchString);
      case SearchCategory.cafeterias:
        ref
            .read(cafeteriaSearchViewModel)
            .cafeteriaSearch(query: this.searchString);
      case SearchCategory.calendar:
        ref
            .read(calendarSearchViewModel)
            .calendarSearch(query: this.searchString);
      case SearchCategory.movie:
        ref.read(movieSearchViewModel).movieSearch(query: this.searchString);
      case SearchCategory.news:
        // TODO(Jakob): add news to search after move to new backend is finalised
        return;
      case SearchCategory.studyRoom:
        ref
            .read(studyRoomSearchViewModel)
            .studyRoomSearch(query: this.searchString);
      case SearchCategory.lectures:
        ref
            .read(lectureSearchViewModel)
            .lectureSearch(query: this.searchString);
      case SearchCategory.personalLectures:
        ref
            .read(personalLectureSearchViewModel)
            .personalLectureSearch(query: this.searchString);
      case SearchCategory.persons:
        ref.read(personSearchViewModel).personSearch(query: this.searchString);
      case SearchCategory.rooms:
        ref
            .read(navigaTumSearchViewModel)
            .navigaTumSearch(query: this.searchString);
      default:
        return;
    }
  }
}
