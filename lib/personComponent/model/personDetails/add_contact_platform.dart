import 'package:campus_flutter/personComponent/model/personDetails/add_contact_platform_interface.dart';
import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:flutter/services.dart';

// this invokes the os specific ways of handling contacts
final class AddContactPlatform extends PlatformInterface {

  AddContactPlatform() : super(token: _token);

  static final Object _token = Object();

  static AddContactPlatform _instance = AddContactPlatform(); // TODO: Maybe remove, or also remove the "extends"

  static AddContactPlatform get instance => _instance;
  static set instance(AddContactPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  static final methodChannel = const MethodChannel('add_contact');

  static Future<void> addPersonAsContact(PersonDetails person) async {
    await methodChannel
        .invokeMethod<void>('addPersonAsContact', {'contact': person.toMapForContact()});
  }
}