//
//  Endpoint.swift
//  GojekContacts
//
//  Created by Amaresh K V on 23/10/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case test
    case production
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

extension NetworkEnvironment {
    func baseUrl() -> String {
        switch self {
        case .production, .test:
            return "https://gojek-contacts-app.herokuapp.com/"
        }
    }

    func contactsEndpoint() -> String {
        switch self {
        case .production, .test:
            return "contacts.json"
        }
    }
}

enum API {
    case getContacts

    func url(environment: NetworkEnvironment) -> URL? {
        switch self {
        case .getContacts:
            return URL(string: environment.baseUrl() + environment.contactsEndpoint())
        }
    }
}


struct Request {
    var method: HTTPMethod?
    var headers: [String: AnyHashable]?
    var data: Data?
    var api: API!
    var environment: NetworkEnvironment!
    var url: URL?
}

