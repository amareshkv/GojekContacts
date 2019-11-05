//
//  WebService.swift
//  GojekContacts
//
//  Created by Amaresh K V on 23/10/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation


enum Result<T: Codable> {
    case success(result: Decodable?)
    case failure(error: Error)
}

class WebService {

    // Create UrlRequest and call dataTask from URLSession
    class func request<T: Codable>(request: Request, completion: @escaping (Result<T>) -> ()) {
        // 2.
        guard let url = request.url else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method?.rawValue
        // 4.
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            // 5.
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error: error!))
                }
                return
            }

            // check if no response from server
            guard let data = data else {
                completion(.success(result: nil))
                return
            }
            // if response, then parse using codable.
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result: responseObject))
                }
            } catch _ {

            }
        }
        dataTask.resume()
    }
}
