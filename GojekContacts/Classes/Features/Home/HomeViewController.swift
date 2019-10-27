//
//  HomeViewController.swift
//  GojekContacts
//
//  Created by Amaresh K V on 23/10/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    fileprivate var contactsArray: [Contact] = [Contact]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    private func setupUI() {
        getContacts()
    }

    // Get contacts from cloud
    // initiated a service layer to call network connection and get codable response.
    func getContacts() {
        NetworkManager.shared.getContacts { (result) in
            self.contactsArray.removeAll()
            switch result {
            case .success(let array):
                if let array = array as? [Contact] {
                    self.contactsArray = array.sorted { $0.firstName < $1.firstName }
                }
                self.tableView.reloadData()
            case .failure(_):
                UtilityAlert.showAlert(withTitle: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("Error in getting contact information", comment: ""))
            }
        }
    }
}


extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeTableViewCell else {
            fatalError("cell not initialized")
        }
        cell.updateContents(contact: contactsArray[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}


