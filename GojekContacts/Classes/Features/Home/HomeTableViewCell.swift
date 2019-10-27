//
//  HomeTableViewCell.swift
//  GojekContacts
//
//  Created by Amaresh K V on 27/10/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var favoriteImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateContents(contact: Contact) {
        self.contactNameLabel.text = contact.firstName
        self.favoriteImageView.isHidden = !contact.favorite
        // download image and show contact image
    }

}
