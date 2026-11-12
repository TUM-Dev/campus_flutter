import 'package:material_ui/material_ui.dart';

class PermissionView extends StatelessWidget {
  const PermissionView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.hint,
    required this.skipLabel,
    required this.onButtonPress,
    required this.onSkip,
    this.isBusy = false,
  });

  final String imagePath;
  final String title;
  final String description;
  final String buttonLabel;
  final String hint;
  final String skipLabel;
  final VoidCallback onButtonPress;
  final VoidCallback onSkip;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.brightness == Brightness.dark
          ? theme.canvasColor
          : Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (constraints.maxHeight - 48).clamp(
                  0,
                  double.infinity,
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.06,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          imagePath,
                          height: 140,
                          fit: BoxFit.contain,
                          excludeFromSemantics: true,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        hint,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: isBusy ? null : onButtonPress,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: isBusy
                              ? const SizedBox.square(
                                  dimension: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(buttonLabel, textAlign: TextAlign.center),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: isBusy ? null : onSkip,
                        child: Text(skipLabel),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
