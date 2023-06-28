import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperLinkText extends StatefulWidget {
  const HyperLinkText({super.key, required this.link, required this.label});

  final String link;
  final String label;

  @override
  State<StatefulWidget> createState() => _HyperlinkTextState();
}

class _HyperlinkTextState extends State<HyperLinkText> {
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
                    .bodyMedium /*?.copyWith(color: Colors.blue)*/,
                recognizer: tapGestureRecognizer
                  ..onTap = () async {
                    final url = Uri.parse(widget.link);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  })),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
        const Icon(Icons.open_in_new, size: 15 /*, color: Colors.blue*/)
      ],
    );
  }
}
