import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/student_club_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentClubSearchResultView extends ConsumerWidget {
  const StudentClubSearchResultView({super.key, required this.searchVM});

  final Provider<SearchViewModel> searchVM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<StudentClubSearchViewModel, StudentClubSearch>(
      searchCategory: SearchCategory.studentClub,
      searchVM: searchVM,
      searchCategoryVM: studentClubSearchViewModel,
      body: (studentClubSearch) {
        return ListTile(
          leading: image(studentClubSearch.studentClub.coverUrl),
          title: Text(studentClubSearch.studentClub.name),
          onTap: () {
            if (studentClubSearch.studentClub.linkUrl.isNotEmpty) {
              UrlLauncher.urlString(studentClubSearch.studentClub.linkUrl, ref);
            }
          },
        );
      },
    );
  }

  Widget image(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: () {
        if (imageUrl.contains("svg")) {
          return Container(
            width: 80,
            height: 50,
            color: Colors.white,
            child: SvgPicture.network(
              imageUrl,
              fit: BoxFit.cover,
              placeholderBuilder:
                  (context) => Image.asset(
                    "assets/images/placeholders/student_club_placeholder.png",
                    fit: BoxFit.cover,
                  ),
            ),
          );
        } else {
          return CachedNetworkImage(
            imageBuilder:
                (context, imageProvider) => Container(
                  color: Colors.white,
                  child: Image(image: imageProvider, fit: BoxFit.cover),
                ),
            width: 80,
            height: 50,
            imageUrl: imageUrl,
            errorWidget:
                (context, url, error) => Image.asset(
                  "assets/images/placeholders/student_club_placeholder.png",
                  fit: BoxFit.cover,
                ),
            fit: BoxFit.cover,
          );
        }
      }(),
    );
  }
}
