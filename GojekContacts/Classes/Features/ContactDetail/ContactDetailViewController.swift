//
//  ContactDetailViewController.swift
//  GojekContacts
//
//  Created by Amaresh K V on 04/11/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    var contact: Contact!
    fileprivate var contactDetail: Contact!

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var mobileNumbertextField: UITextField!
    @IBOutlet weak var emailextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getContactDetail()
        // Do any additional setup after loading the view.
    }
    

    private func updateUI() {
        if let firstName = contactDetail.firstName, let lastName = contactDetail.lastName {
            contactNameLabel.text = "\(String(describing: firstName)) \(lastName)"
        }
        mobileNumbertextField.text = contactDetail.phoneNumber
        emailextField.text = contactDetail.email
    }

    private func getContactDetail() {
        guard let url = contact.url else {
            return
        }
        NetworkManager.shared.getContactDetail(url: url) { (result) in
            switch result {
            case .success(let contact):
                if let contact = contact as? Contact {
                    self.contactDetail = contact
                    self.updateUI()
                }
            case .failure(let error):
                break
            }
        }
    }

}
