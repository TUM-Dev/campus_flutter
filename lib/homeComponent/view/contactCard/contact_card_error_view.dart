import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:material_ui/material_ui.dart';

class ContactCardErrorView extends StatelessWidget {
  const ContactCardErrorView({
    super.key,
    required this.error,
    this.stackTrace,
    this.retry,
  });

  final Object error;
  final StackTrace? stackTrace;
  final VoidCallback? retry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/placeholders/portrait_placeholder.png',
            ),
            radius: 50,
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: ErrorHandlingRouter(
              error: error,
              stackTrace: stackTrace,
              errorHandlingViewType: ErrorHandlingViewType.textOnly,
              retry: retry,
            ),
          ),
        ],
      ),
    );
  }
}
