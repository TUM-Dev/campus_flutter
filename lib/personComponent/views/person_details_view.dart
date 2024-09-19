import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/base_64_decode_image_data.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:campus_flutter/personComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PersonDetailsScaffold extends StatelessWidget {
  const PersonDetailsScaffold({super.key, required this.obfuscatedId});

  final String obfuscatedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(context.tr("personDetails")),
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
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
          );
        } else {
          return Center(
            child: DelayedLoadingIndicator(
              name: context.tr("personDetails"),
            ),
          );
        }
      },
    );
  }

  Widget _body(PersonDetails personDetails) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _image(personDetails.imageData),
            _name(personDetails.fullNameWithTitle),
            _contact(personDetails),
            if (personDetails.rooms.isNotEmpty) _room(personDetails),
          ],
        ),
      ),
    );
  }

  Widget _name(String name) {
    return Padding(
      padding: EdgeInsets.all(context.padding),
      child: Text(
        name,
        textAlign: TextAlign.center,
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
              'assets/images/placeholders/portrait_placeholder.png',
            ),
    );
  }

  Widget _contact(PersonDetails personDetails) {
    return WidgetFrameView(
      title: context.tr("contact"),
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            ListTile(
              leading: Icon(
                Icons.email,
                color: context.theme.primaryColor,
              ),
              title: Text(
                personDetails.email,
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
              onTap: () =>
                  UrlLauncher.urlString("mailto:${personDetails.email}", ref),
            ),
            if (personDetails.phoneExtensions.firstOrNull?.phoneNumber != null)
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: context.theme.primaryColor,
                ),
                title: Text(
                  personDetails.phoneExtensions.first.phoneNumber ??
                      context.tr("unknown"),
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () => UrlLauncher.urlString(
                  "tel:${personDetails.phoneExtensions.firstOrNull?.phoneNumber}",
                  ref,
                ),
              ),
            if (personDetails.officialContact?.homepage != null)
              ListTile(
                leading: Icon(
                  Icons.web,
                  color: context.theme.primaryColor,
                ),
                title: Text(
                  personDetails.officialContact!.homepage!,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () => UrlLauncher.urlString(
                  personDetails.officialContact!.homepage!,
                  ref,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _room(PersonDetails personDetails) {
    return WidgetFrameView(
      title: context.tr("room"),
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            ListTile(
              leading: Icon(
                Icons.room,
                color: context.theme.primaryColor,
              ),
              title: Text(
                personDetails.rooms.first.shortLocationDescription ??
                    context.tr("unknown"),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
              onTap: () => context.push(
                roomSearch,
                extra: (
                  personDetails.rooms.first.id,
                  null,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.stairs,
                color: context.theme.primaryColor,
              ),
              title: Text(
                personDetails.rooms.first.floorName ?? context.tr("unknown"),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance,
                color: context.theme.primaryColor,
              ),
              title: Text(
                personDetails.rooms.first.buildingName ?? context.tr("unknown"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
