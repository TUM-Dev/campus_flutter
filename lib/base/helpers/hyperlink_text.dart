import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HyperLinkText extends ConsumerStatefulWidget {
  const HyperLinkText({super.key, this.link, this.uri, required this.label});

  final String? link;
  final Uri? uri;
  final String label;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HyperlinkTextState();
}

class _HyperlinkTextState extends ConsumerState<HyperLinkText> {
  late TapGestureRecognizer tapGestureRecognizer;

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tapGestureRecognizer = TapGestureRecognizer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
            text: TextSpan(
                text: widget.label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium,
                recognizer: tapGestureRecognizer
                  ..onTap = () {
                    if (widget.link != null) {
                      UrlLauncher.urlString(widget.link!, ref);
                    } else if (widget.uri != null) {
                      UrlLauncher.url(widget.uri!, ref);
                    }
                  })),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
        const Icon(Icons.open_in_new, size: 15 /*, color: Colors.blue*/)
      ],
    );
  }
}
