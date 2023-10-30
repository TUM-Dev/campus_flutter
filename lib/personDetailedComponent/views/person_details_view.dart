import 'package:campus_flutter/base/extensions/base_64_decode_image_data.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/personDetailedComponent/model/person_details.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/searchComponent/views/personRoomSearch/search_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonDetailsScaffold extends StatelessWidget {
  const PersonDetailsScaffold({super.key, required this.obfuscatedId});

  final String obfuscatedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Person Details"),
      ),
      body: PersonDetailsView(
        obfuscatedId: obfuscatedId,
      ),
    );
  }
}

class PersonDetailsView extends ConsumerStatefulWidget {
  const PersonDetailsView({super.key, required this.obfuscatedId});

  final String obfuscatedId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonDetailsViewState();
}

class _PersonDetailsViewState extends ConsumerState<PersonDetailsView> {
  late Provider<PersonDetailsViewModel> viewModel;

  @override
  void initState() {
    viewModel = personDetailsViewModel(widget.obfuscatedId);
    ref.read(viewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(viewModel).personDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _body(snapshot.data!);
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
                error: snapshot.error!,
                errorHandlingViewType: ErrorHandlingViewType.fullScreen);
          } else {
            return const Center(
              child: DelayedLoadingIndicator(name: "Person Details"),
            );
          }
        });
  }

  Widget _body(PersonDetails personDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _image(personDetails.imageData),
        _name(personDetails.fullNameWithTitle),
        _contact(personDetails),
        if (personDetails.rooms != null) _room(personDetails)
      ],
    );
  }

  Widget _name(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.padding),
      child: Text(
        name,
        style: context.theme.textTheme.titleLarge,
      ),
    );
  }

  Widget _image(String? imageData) {
    return CircleAvatar(
      radius: 80,
      backgroundColor: context.theme.canvasColor,
      backgroundImage: imageData != null
          ? Image.memory(base64DecodeImageData(imageData)).image
          : const AssetImage(
              'assets/images/placeholders/portrait_placeholder.png'),
    );
  }

  Widget _contact(PersonDetails personDetails) {
    return WidgetFrameView(
        title: "Contact",
        child: Card(
          child: SeparatedList.widgets(
            widgets: [
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: context.theme.primaryColor,
                ),
                title: Text(personDetails.email,
                    style:
                        const TextStyle(decoration: TextDecoration.underline)),
                onTap: () =>
                    UrlLauncher.urlString("mailto:${personDetails.email}", ref),
              ),
              if (personDetails.phoneExtensions?.first.phoneNumber != null)
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: context.theme.primaryColor,
                  ),
                  title: Text(personDetails.phoneExtensions!.first.phoneNumber,
                      style: const TextStyle(
                          decoration: TextDecoration.underline)),
                  onTap: () => UrlLauncher.urlString(
                      "tel:${personDetails.phoneExtensions!.first.phoneNumber}",
                      ref),
                ),
              if (personDetails.officialContact?.homepage != null)
                ListTile(
                  leading: Icon(
                    Icons.web,
                    color: context.theme.primaryColor,
                  ),
                  title: Text(
                    personDetails.officialContact!.homepage!,
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                  onTap: () => UrlLauncher.urlString(
                      personDetails.officialContact!.homepage!, ref),
                ),
            ],
          ),
        ));
  }

  Widget _room(PersonDetails personDetails) {
    return WidgetFrameView(
        title: "Room",
        child: Card(
          child: SeparatedList.widgets(
            widgets: [
              ListTile(
                leading: Icon(
                  Icons.room,
                  color: context.theme.primaryColor,
                ),
                title:
                    Text(personDetails.rooms!.first.shortLocationDescription),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonRoomSearchScaffold(
                              searchString: personDetails.rooms!.first.id,
                            ))),
              ),
              ListTile(
                leading: Icon(
                  Icons.stairs,
                  color: context.theme.primaryColor,
                ),
                title: Text(personDetails.rooms!.first.floorName),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: context.theme.primaryColor,
                ),
                title: Text(personDetails.rooms!.first.buildingName),
              ),
            ],
          ),
        ));
  }
}
