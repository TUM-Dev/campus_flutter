import 'dart:async';

import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:lottie/lottie.dart';

/// Date validity is a local display check, not proof of authenticity.
class StudentCardValidityBadge extends StatefulWidget {
  const StudentCardValidityBadge({
    super.key,
    required this.studentCard,
    this.now = DateTime.now,
  });

  final StudentCard studentCard;

  /// Allows expiry transitions to be checked without changing the device clock.
  final DateTime Function() now;

  @override
  State<StudentCardValidityBadge> createState() =>
      _StudentCardValidityBadgeState();
}

class _StudentCardValidityBadgeState extends State<StudentCardValidityBadge>
    with WidgetsBindingObserver {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    // Update even if the sheet stays open across a validity boundary.
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _timer?.cancel();
    if (state == AppLifecycleState.resumed) {
      setState(() {});
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validity = widget.studentCard.validityAt(widget.now());
    if (validity == StudentCardValidity.current) {
      return SizedBox(
        height: 40,
        width: 80,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Lottie.asset(
                'assets/lottieFiles/gradient_background_blue_white_speedup.json',
              ),
            ),
            const Center(
              child: Text(
                'VALID',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      );
    }
    final key = switch (validity) {
      StudentCardValidity.current => throw StateError(
        'Current card handled above',
      ),
      StudentCardValidity.notYetValid => 'studentCardNotYetValid',
      StudentCardValidity.expired => 'studentCardExpired',
      StudentCardValidity.invalid => 'studentCardInvalid',
    };
    final colors = Theme.of(context).colorScheme;
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: colors.errorContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          context.tr(key),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colors.onErrorContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
