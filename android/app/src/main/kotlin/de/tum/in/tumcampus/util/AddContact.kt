package de.tum.`in`.tumcampus.util

import android.util.Base64
import android.app.Activity
import android.content.ContentValues
import android.content.Intent
import android.provider.ContactsContract
import android.provider.ContactsContract.CommonDataKinds
import android.provider.ContactsContract.CommonDataKinds.Email
import android.provider.ContactsContract.CommonDataKinds.Phone
import android.provider.ContactsContract.CommonDataKinds.StructuredName
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class AddContact {

    companion object {

        fun addPersonAsContact(personDetails: Map<String, Any>?, activity: Activity): Boolean {
            if (personDetails == null) {
                return false;
            }

            val data = ArrayList<ContentValues>()

            // add the name
            if (personDetails.containsKey("titel") && personDetails["titel"] is String) {
                val row = ContentValues()
                row.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.StructuredName.CONTENT_ITEM_TYPE)
                row.put(ContactsContract.CommonDataKinds.StructuredName.PREFIX, personDetails["titel"].toString())
                data.add(row)
            }
            if (personDetails.containsKey("vorname") && personDetails["vorname"] is String) {
                val row = ContentValues()
                row.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.StructuredName.CONTENT_ITEM_TYPE)
                row.put(ContactsContract.CommonDataKinds.StructuredName.GIVEN_NAME, personDetails["vorname"].toString())
                data.add(row)
            }
            if (personDetails.containsKey("familienname") && personDetails["familienname"] is String) {
                val row = ContentValues()
                row.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.StructuredName.CONTENT_ITEM_TYPE)
                row.put(ContactsContract.CommonDataKinds.StructuredName.FAMILY_NAME, personDetails["familienname"].toString())
                data.add(row)
            }

            val contactInfos = mapOf(
                "privat" to personDetails["privat"],
                "dienstlich" to personDetails["dienstlich"]
            )

            // add contact information
            for (entry in contactInfos.entries.iterator()) {
                val type = entry.key
                val contactInfo = entry.value

                if (contactInfo != null && contactInfo is Map<*, *>) {
                    if (contactInfo.containsKey("www_homepage") && contactInfo["www_homepage"] is String) {
                        val row = ContentValues()
                        row.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.Website.CONTENT_ITEM_TYPE)
                        row.put(ContactsContract.CommonDataKinds.Website.TYPE, if (type == "dienstlich") ContactsContract.CommonDataKinds.Website.TYPE_WORK else ContactsContract.CommonDataKinds.Website.TYPE_HOME)
                        row.put(ContactsContract.CommonDataKinds.Website.URL, contactInfo["www_homepage"].toString())
                        data.add(row)
                    }
                    if (contactInfo.containsKey("telefon") && contactInfo["telefon"] is String) {
                        val row = ContentValues()
                        row.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE)
                        row.put(ContactsContract.CommonDataKinds.Phone.TYPE, if (type == "dienstlich") ContactsContract.CommonDataKinds.Phone.TYPE_WORK else ContactsContract.CommonDataKinds.Phone.TYPE_HOME)
                        row.put(ContactsContract.CommonDataKinds.Phone.NUMBER, contactInfo["telefon"].toString())
                        data.add(row)
                    }
                    if (contactInfo.containsKey("mobiltelefon") && contactInfo["mobiltelefon"] is String) {
                        val row = ContentValues()
                        row.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE)
                        row.put(ContactsContract.CommonDataKinds.Phone.TYPE, if (type == "dienstlich") ContactsContract.CommonDataKinds.Phone.TYPE_WORK else ContactsContract.CommonDataKinds.Phone.TYPE_HOME)
                        row.put(ContactsContract.CommonDataKinds.Phone.NUMBER, contactInfo["mobiltelefon"].toString())
                        data.add(row)
                    }
                    if (contactInfo.containsKey("fax") && contactInfo["fax"] is String) {
                        val row = ContentValues()
                        row.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE)
                        row.put(ContactsContract.CommonDataKinds.Phone.TYPE, if (type == "dienstlich") ContactsContract.CommonDataKinds.Phone.TYPE_FAX_WORK else ContactsContract.CommonDataKinds.Phone.TYPE_FAX_HOME)
                        row.put(ContactsContract.CommonDataKinds.Phone.NUMBER, contactInfo["fax"].toString())
                        data.add(row)
                    }
                }
            }

            val intent = Intent(ContactsContract.Intents.Insert.ACTION).apply {
                type = ContactsContract.RawContacts.CONTENT_TYPE

                // insert the email address as a work address
                if (personDetails.containsKey("email") && personDetails["email"] is String) {
                    putExtra(ContactsContract.Intents.Insert.EMAIL, personDetails["email"].toString())
                    putExtra(ContactsContract.Intents.Insert.EMAIL_TYPE, Email.TYPE_WORK)
                }
            }
            intent.putParcelableArrayListExtra(ContactsContract.Intents.Insert.DATA, data)

            println("Adding contact with details: ${personDetails}")
            val packageManager = activity.packageManager
            if (intent.resolveActivity(packageManager) != null) {
                activity.startActivity(intent)
                return true
            } else {
                println("Keine App gefunden, die den Kontakt-Intent verarbeiten kann.")
                return false
            }
        }
    }
}