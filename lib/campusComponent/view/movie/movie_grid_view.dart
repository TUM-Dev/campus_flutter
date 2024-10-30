import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/view/movie/movie_card_view.dart';
import 'package:flutter/material.dart';

class MovieGridView extends StatelessWidget {
  const MovieGridView({
    super.key,
    required this.movies,
    required this.padding,
    required this.crossAxisCount,
    required this.withinScrollView,
  });

  final List<Movie> movies;
  final EdgeInsets padding;
  final int crossAxisCount;
  final bool withinScrollView;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: withinScrollView,
      physics: withinScrollView ? NeverScrollableScrollPhysics() : null,
      padding: padding,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: context.padding,
      crossAxisSpacing: context.padding,
      childAspectRatio: 250 / 470,
      children: [for (var movie in movies) MovieCardView(movie: movie)],
    );
  }
}
