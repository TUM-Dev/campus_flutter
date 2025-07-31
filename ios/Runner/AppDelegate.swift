import UIKit
import Flutter
import GoogleMaps
import Contacts
import ContactsUI

@main
@objc class AppDelegate: FlutterAppDelegate, CNContactViewControllerDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyAxUbnUMsXWVzeptXiLuNDMGpGEVFHLT4Y")
    GeneratedPluginRegistrant.register(with: self)
    
    
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "add_contact", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { [weak self] (call, result) in
      if call.method == "addPersonAsContact" {
        guard let args = call.arguments as? [String: AnyObject] else { result(false); return }
        self?.flutterResult = result
        let contact = AddContact.loadDataToContact(data: args)
        _ = AddContact.addNewContact(contact: contact, delegate: self!)
      }
    }
    

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // CNContactViewControllerDelegate
  func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
    viewController.dismiss(animated: true, completion: nil)
    flutterResult?(contact != nil)
    flutterResult = nil
  }
}
