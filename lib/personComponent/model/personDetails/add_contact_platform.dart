import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:flutter/services.dart';

// this invokes the os specific ways of handling contacts
final class AddContactPlatform {

  static final methodChannel = const MethodChannel('add_contact');

  static Future<void> addPersonAsContact(PersonDetails person) async {
    await methodChannel
        .invokeMethod<void>('addPersonAsContact', {'contact': person.toMapForContact()});
  }
}