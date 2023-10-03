import 'dart:async';
import 'dart:collection';

import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/searchComponent/model/vocab.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
  late HashMap vocab2;

  GlobalSearchViewModel(this.ref) {
    if (!kIsWeb) {
      loadVocabulary();
      initializeNaturalLanguageModel();
    }
  }

  Future initializeNaturalLanguageModel() async {
    interpreter =
        await Interpreter.fromAsset('assets/models/english_bert_30.tflite');
  }

  void loadVocabulary() async {
    vocab2 = HashMap();
    var config = await rootBundle.loadString("assets/models/myfile.txt");
    config.split('\n').forEach((value) {
      vocab2[value] = vocab2.length;
    });
  }

  void search(int index, String searchString) async {
    if (searchString.isEmpty) {
      clear();
      return;
    }
    this.index = index;
    this.searchString = searchString;
    if (selectedCategories.value.isEmpty) {
      if (index == 0) {
        if (!kIsWeb) {
          _textClassificationModel(searchString);
        } else {
          _webSearch(searchString);
        }
      } else {
        switch (index) {
          case 1:
            result.add([SearchCategory.grade]);
          case 2:
            result.add(
                [SearchCategory.personalLectures, SearchCategory.lectures]);
          case 3:
            result.add([SearchCategory.calendar]);
          case 4:
            result.add([SearchCategory.cafeterias, SearchCategory.studyRoom]);
        }
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
    switch (index) {
      case 1:
        ref.read(gradesSearchViewModel).gradesSearch(query: this.searchString);
      case 2:
        ref
            .read(personalLectureSearchViewModel)
            .personalLectureSearch(query: this.searchString);
        ref
            .read(lectureSearchViewModel)
            .lectureSearch(query: this.searchString);
      case 3:
        ref
            .read(calendarSearchViewModel)
            .calendarSearch(query: this.searchString);
      case 4:
        ref
            .read(cafeteriaSearchViewModel)
            .cafeteriaSearch(query: this.searchString);
        ref
            .read(studyRoomSearchViewModel)
            .studyRoomSearch(query: this.searchString);
      default:
        ref.read(gradesSearchViewModel).gradesSearch(query: this.searchString);
        ref
            .read(personalLectureSearchViewModel)
            .personalLectureSearch(query: this.searchString);
        ref.read(movieSearchViewModel).movieSearch(query: this.searchString);
        ref
            .read(calendarSearchViewModel)
            .calendarSearch(query: this.searchString);
        ref
            .read(cafeteriaSearchViewModel)
            .cafeteriaSearch(query: this.searchString);
        ref
            .read(studyRoomSearchViewModel)
            .studyRoomSearch(query: this.searchString);
        ref.read(personSearchViewModel).personSearch(query: this.searchString);
        ref
            .read(lectureSearchViewModel)
            .lectureSearch(query: this.searchString);
    }
  }
}
