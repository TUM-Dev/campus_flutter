import 'package:campus_flutter/base/errorHandling/api_failure.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:grpc/grpc.dart';

class GrpcErrorRouter extends StatelessWidget with ErrorHandlingView {
  GrpcErrorRouter({
    super.key,
    required this.grpcError,
    required ErrorHandlingViewType errorHandlingViewType,
    Function()? retry,
    this.isMutation = false,
    Color? titleColor,
    Color? bodyColor,
  }) {
    this.errorHandlingViewType = errorHandlingViewType;
    this.retry = retry;
    this.titleColor = titleColor;
    this.bodyColor = bodyColor;
  }

  final GrpcError grpcError;

  final bool isMutation;

  @override
  Widget build(BuildContext context) {
    final failure = ApiFailure.from(grpcError);
    final mutation = isMutation;
    return exceptionMessage(
      errorMessage: context.tr(failure.messageKey),
      fixMessage: context.tr(failure.recoveryKeyFor(isMutation: mutation)),
      allowRetry: failure.canRetry(isMutation: mutation),
      context: context,
    );
  }
}
