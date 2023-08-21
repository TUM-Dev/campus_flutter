
/*class SearchResultCardView<T extends SearchViewModel> extends ConsumerWidget {
  const SearchResultCardView(
      {super.key,
      required this.searchCategory,
      required this.viewModel,
      required this.body});

  final Provider<SearchViewModel> viewModel;
  final SearchCategory searchCategory;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
        title: searchCategory.title,
        child: StreamBuilder(
          stream: ref.watch<SearchViewModel>(viewModel).,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text("Success");
            } else if (snapshot.hasError) {
              return ErrorHandlingView(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly);
            } else {
              return DelayedLoadingIndicator(
                name: searchCategory.title,
              );
            }
          },
        ));
  }
}*/
