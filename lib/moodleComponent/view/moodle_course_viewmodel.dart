import 'dart:io';
import 'dart:typed_data';

import 'package:campus_flutter/moodleComponent/model/moodle_course.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_section.dart';
import 'package:campus_flutter/moodleComponent/networking/apis/MoodleApi.dart';
import 'package:campus_flutter/moodleComponent/service/shibboleth_session_generator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class MoodleCourseViewModel extends ConsumerStatefulWidget {
  final MoodleCourse course;
  final MoodleApi api;
  final ShibbolethSession session;
  const MoodleCourseViewModel(this.session, this.api, this.course, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoodleCourseViewModelState();
}

class _MoodleCourseViewModelState extends ConsumerState<MoodleCourseViewModel> {
  late Future<void> _future;
  Widget? sectionSelection;
  int currentIndex = -1;

  @override
  void initState() {
    super.initState();
    _future = connectToMoodle();
  }

  Future<void> connectToMoodle() async {
    return widget.course.fetchState(widget.api);
  }

  @override
  Widget build(BuildContext context) {
    return widget.course.state == null
        ? FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                if(MediaQuery.of(context).orientation == Orientation.portrait) {
                  return Column(
                    children: [
                      widget.course.build(context, withArrowForward: false, withArrowBackward: true),
                      const Center(child: CupertinoActivityIndicator()),
                    ],
                  );
                }
                return Row(
                  children: [
                    widget.course.build(context, withArrowForward: false, withArrowBackward: true),
                    const Center(child: CupertinoActivityIndicator()),
                  ],
                );
              } else if (snapshot.hasError) {
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                if(MediaQuery.of(context).orientation == Orientation.portrait) {
                  return Column(
                    children: [
                      widget.course.build(context, withArrowForward: false, withArrowBackward: true),
                      const SizedBox(height: 10),
                      buildCourseContent(),
                      sectionSelection ?? Container(),
                    ],
                  );
                }
                return Row(
                  children: [
                    widget.course.build(context, withArrowForward: false, withArrowBackward: true),
                    const SizedBox(width: 10),
                    buildCourseContent(),
                    sectionSelection ?? Container(),
                  ],
                );
              }
            },
          )
        :
        MediaQuery.of(context).orientation == Orientation.portrait ?
          Column(
            children: [
              widget.course.build(context, withArrowForward: false, withArrowBackward: true),
              buildCourseContent(),
              sectionSelection ?? Container(),
            ],
          )
          :
    Row(
            children: [
              widget.course.build(context, withArrowForward: false, withArrowBackward: true),
              buildCourseContent(),
              sectionSelection ?? Container(),
            ],
          );
  }

  Widget buildCourseContent() {
    return SizedBox(
      width:  MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.06 : MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final content = widget.course.state!.section[index];
          return Card(
            shape: content.isCurrentlyRelevant() ? StadiumBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 2.0,
              ),
            ):null,
            color: currentIndex == index
                ? Theme.of(context).colorScheme.primaryContainer
                : null,
            child: SizedBox(
              width:  MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.width*0.3 : MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.06 : MediaQuery.of(context).size.height,
              child: ListTile(
              title: Text(
                content.title,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              onTap: () {
                setState(() {
                  currentIndex = index;
                  sectionSelection = buildSectionWidgetForSection(content);
                });
              },
            ),
          ));
        },
        itemCount: widget.course.state!.section.length,
        scrollDirection: MediaQuery.of(context).orientation == Orientation.portrait ? Axis.horizontal : Axis.vertical,
      ),
    );
  }

  Widget buildSectionWidgetForSection(MoodleSection section) {
    var cmList = section.cmList;
    return FutureBuilder(
      future: getCmListContents(cmList),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snap.hasError) {
          return Text("Es ist ein Fehler aufgetreten: ${snap.error}");
        } else {
          return SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.width :  MediaQuery.of(context).size.width * 0.45,
            height:MediaQuery.of(context).orientation == Orientation.portrait? MediaQuery.of(context).size.height*0.6: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: snap.data!
                    .map(
                      (htmlContent) => Column(
                        children: buildFinalWidgetsFromSegments(
                          segmentHtmlContent(htmlContent),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }

  final RegExp imgTagRegex = RegExp(
    '(<img\s+[^>]*src\s*=\s*["\']([^"\']*)["\'][^>]*>)',
    caseSensitive: false,
  );

  List<String> segmentHtmlContent(String fullHtml) {
    var split = fullHtml.split("<img");
    var segments = split;
    for (var i = 1; i < split.length; i += 2) {
      var value = split[i];
      var subvalue = value.split(">");
      segments.removeAt(i);
      segments.insert(i, "<img${subvalue[0]}>");
      if (subvalue.length > 1) {
        segments.insert(i + 1, subvalue.sublist(1).join(">"));
      } else {
        segments.insert(i + 1, "");
      }
    }
    return segments;
  }

  String? extractImageUrl(String imgTag) {
    final Match? srcMatch = RegExp(
      'src\s*=\s*["\']([^"\']*)["\']',
      caseSensitive: false,
    ).firstMatch(imgTag);
    return srcMatch?.group(1);
  }

  List<Widget> buildFinalWidgetsFromSegments(List<String> segments) {
    final List<Widget> widgets = [];

    for (final segment in segments) {
      if (segment.startsWith('<img') && segment.endsWith('>')) {
        final String? imageUrl = extractImageUrl(segment);
        if (imageUrl != null) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SvgPicture.network(
                imageUrl,
                colorFilter: ColorFilter.mode(
                  Colors.deepOrange,
                  BlendMode.srcIn,
                ),
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, color: Colors.red),
              ),
            ),
          );
        }
      } else {
        final String md = html2md.convert(segment);
        widgets.add(
          GptMarkdown(
            md,
            linkBuilder:
                (
                  BuildContext context,
                  InlineSpan text,
                  String url,
                  TextStyle style,
                ) {
                  return GestureDetector(
                    onTap: () {
                      showLinkConfirmationDialog(context, url);
                    },
                    child: Text.rich(
                      text,
                      style: style.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  );
                },
          ),
        );
      }
    }
    return widgets;
  }

  Future<void> showLinkConfirmationDialog(
    BuildContext context,
    String url,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.open_in_new, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                'Link öffnen',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Möchtest du den folgenden externen Link öffnen?',
                style: TextStyle(color: Colors.grey[700]),
              ),

              const SizedBox(height: 5),
              Text(
                url,
                style: const TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),

          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Abbrechen'),
            ),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
                dialogContext.push(
                    '/webviewPage',
                    extra: {
                      'url': url,
                    }
                );

              },
              icon: const Icon(Icons.launch, size: 18),
              label: const Text('Öffnen'),
            ),
          ],
        );
      },
    );
  }

  Future<List<String>> getCmListContents(List<String> cmList) async {
    List<String> contents = [];
    for (var cmId in cmList) {
      contents.add(await widget.api.loadHtmlDataForMoodleModule(cmId));
    }
    return contents;
  }
}

class MoodleCourseArguments {
  final ShibbolethSession session;
  final MoodleApi api;
  final MoodleCourse course;

  MoodleCourseArguments({
    required this.session,
    required this.api,
    required this.course,
  });
}

class WebViewPage extends StatefulWidget {
  final String url;

  // Der Konstruktor benötigt nur noch die URL
  const WebViewPage({
    required this.url,
    super.key,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final GlobalKey webViewKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
      onDownloadStartRequest: (controller, downloadStartRequest) async {
        final String url = downloadStartRequest.url.toString();
        final String fileName = downloadStartRequest.suggestedFilename ?? url.split('/').last;

        final cookieManager = CookieManager.instance();
        final cookies = await cookieManager.getCookies(url: WebUri(url));
        final cookieHeader = cookies.map((c) => '${c.name}=${c.value}').join('; ');

        try {
          ScaffoldMessenger.of(context).showSnackBar(

              SnackBar(content: Text('Download von "$fileName" gestartet...'), duration: Duration(seconds: 1),)
          );
          await downloadAndOpenFile(url, fileName, cookieHeader);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Datei wird geöffnet...!'))
          );

        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Download fehlgeschlagen: ${e.toString()}'))
          );
        }

        return null;
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        final Uri? url = navigationAction.request.url;

        if (url != null) {
          
          final String urlString = url.toString();
          if (urlString.toLowerCase().endsWith(".pdf")) {
            final cookieManager = CookieManager.instance();
            final cookies = await cookieManager.getCookies(url: WebUri(url.toString()));
            final cookieHeader = cookies.map((c) => '${c.name}=${c.value}').join('; ');
            final String fileName = urlString.split("/").last;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Download von "$fileName" gestartet. Bitte warten...'), duration: Duration(seconds: 1),)
            );
            context.pushReplacement("/pdf-viewer", extra: downloadAndOpenFile(urlString, fileName, cookieHeader));
            return NavigationActionPolicy.CANCEL;
          }
        }

        return NavigationActionPolicy.ALLOW;
      },
    );
  }

  Future<String> downloadAndOpenFile(String url, String fileName, String cookieHeader) async {

    final Directory dir = await getApplicationDocumentsDirectory();


    final String savePath = '${dir.path}/$fileName';
    var file = File(savePath);
    if(file.existsSync()) {
      OpenFilex.open(savePath);
      return savePath;
    }

    final Dio dio = Dio();

    await dio.download(
      url,
      savePath,
      options: Options(
        headers: {
          'Cookie': cookieHeader,
        },
        followRedirects: true,
      ),
      onReceiveProgress: (received, total) {
        if (total != -1) {
        }
      },
    );
    OpenFilex.open(savePath);
    debugPrint('Datei erfolgreich gespeichert unter: $savePath');
    return savePath;
  }
}

class PdfViewScreen extends StatelessWidget {
  final Future<String> stringPathFuture;
  const PdfViewScreen({
    super.key,
    required this.stringPathFuture
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Dokument')),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(future: stringPathFuture, builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Fehler beim Laden des PDFs: ${snapshot.error}");
            } else {
              return ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  OpenFilex.open(snapshot.data!);

                },
                icon: const Icon(Icons.settings, size: 18),
                label: const Text('Öffnen'),
              );
            }
          }),
          Text("Das PDF-Dokument wird geladen... Bitte warten")

        ],
      ))
    );
  }
}