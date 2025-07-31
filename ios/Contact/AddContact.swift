class AddContact: NSObject {
    
    public static func loadDataToContact(data: [String:AnyObject?]) -> CNMutableContact {
        let contact = CNMutableContact()

        if let title = data["titel"] as? String {
            contact.namePrefix = title
        }

        if let firstname = data["vorname"] as? String {
            contact.givenName = firstname
        }

        if let lastname = data["familienname"] as? String {
            contact.familyName = lastname
        }

        if let email = data["email"] as? String {
            let emailAddress = CNLabeledValue<NSString>(label: CNLabelWork, value: email as NSString)

            // Add the email address to the contact
            contact.emailAddresses = [emailAddress]
        }

        let phoneNumbers = []
        let urlAddresses = []

        // for public numbers
        if let dienstlich = data["dienstlich"] as? [String: String?] {
            if let phone = dienstlich["telefon"] as? String {
                let phoneNumber = CNPhoneNumber(stringValue: phone)
                let phoneLabel = CNLabeledValue(label: CNLabelWork, value: phoneNumber)
                phoneNumbers.append(phoneLabel)
            }

            if let phone = dienstlich["fax"] as? String {
                let phoneNumber = CNPhoneNumber(stringValue: phone)
                let phoneLabel = CNLabeledValue(label: CNLabelPhoneNumberWorkFax, value: phoneNumber)
                phoneNumbers.append(phoneLabel)
            }

            if let phone = dienstlich["mobiltelefon"] as? String {
                let phoneNumber = CNPhoneNumber(stringValue: phone)
                let phoneLabel = CNLabeledValue(label: CNLabelPhoneNumberMobile, value: phoneNumber)
                phoneNumbers.append(phoneLabel)
            }

            if let url = dienstlich["www_homepage"] as? String {
                let urlAddress = CNLabeledValue<NSString>(label: CNLabelURLAddressHomePage, value: url as NSString)
                urlAddresses.append(urlAddress)
            }

        }

        // for private numbers
        if let privat = data["privat"] as? [String: String?] {
            if let phone = privat["telefon"] as? String {
                let phoneNumber = CNPhoneNumber(stringValue: phone)
                let phoneLabel = CNLabeledValue(label: CNLabelHome, value: phoneNumber)
                phoneNumbers.append(phoneLabel)
            }

            if let phone = privat["fax"] as? String {
                let phoneNumber = CNPhoneNumber(stringValue: phone)
                let phoneLabel = CNLabeledValue(label: CNLabelPhoneNumberHomeFax, value: phoneNumber)
                phoneNumbers.append(phoneLabel)
            }

            if let phone = privat["mobiltelefon"] as? String {
                let phoneNumber = CNPhoneNumber(stringValue: phone)
                let phoneLabel = CNLabeledValue(label: CNLabelPhoneNumberMobile, value: phoneNumber)
                phoneNumbers.append(phoneLabel)
            }

            if let url = privat["www_homepage"] as? String {
                let urlAddress = CNLabeledValue<NSString>(label: CNLabelURLAddressHomePage, value: url as NSString)
                urlAddresses.append(urlAddress)
            }

        }

        if let phone = data["phone"] as? String {
            let phoneNumber = CNPhoneNumber(stringValue: phone)

            // Create a label for the phone number (e.g., Home, Work, Mobile)
            let phoneLabel = CNLabeledValue(label: CNLabelPhoneNumberMain, value: phoneNumber)

            // Add the phone number to the contact
            contact.phoneNumbers = [phoneLabel]
        }

        return contact;
    }

    public static func addNewContact(contact: CNMutableContact, delegate: CNContactViewControllerDelegate) -> Bool {
        guard let viewController = UIApplication.shared.delegate?.window??.rootViewController else {
            return false
        }

        let contactViewController = CNContactViewController(forNewContact: contact)
        contactViewController.delegate = delegate
        let navigationController = UINavigationController(rootViewController: contactViewController)
        viewController.present(navigationController, animated: true, completion: nil)
        return true
    }
}