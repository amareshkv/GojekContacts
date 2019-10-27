//
//  NetworkManager.swift
//  GojekContacts
//
//  Created by Amaresh K V on 23/10/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation


protocol ContactsAPI {
    func getContacts(completion: @escaping (Result<[Contact]>) -> Void)
}

class NetworkManager: ContactsAPI {
    static let shared = NetworkManager()
    var environment = NetworkEnvironment.test

    private init() {
    }
    
    func getContacts(completion: @escaping (Result<[Contact]>) -> Void) {
        let request = Request(method: .get, headers: [:], data: nil, api: API.getContacts, environment: environment)
        WebService.request(request: request) { (result) in
            completion(result)
        }
    }
}
