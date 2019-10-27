//
//  Contact.swift
//  GojekContacts
//
//  Created by Amaresh K V on 23/10/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation

struct Contact: Codable {
    var id: Int?
    var firstName: String!
    var lastName: String?
    var profilePicURL: String?
    var favorite: Bool
    var url: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePicURL = "profile_pic"
        case favorite
        case url
        case id
    }
}
