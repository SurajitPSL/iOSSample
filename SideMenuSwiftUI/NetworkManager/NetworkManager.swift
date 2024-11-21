//
//  NetworkManager.swift
//  SideMenuSwiftUI
//
//  Created by Surajit Dhara on 13/11/23.
//

import Foundation


class NetworkManager{
    
    static var sharedManager = NetworkManager()
    private let session: URLSession
    private init (session: URLSession = .shared){
        self.session = session
    }
    
    func requestApi(API: String, completion: @escaping (Result<Data, NetworkError>) -> ()){
        // Validate string URL
        guard let url = URL(string: API) else {
            completion(.failure(.INVALID_URL))
            return
        }
        // Send request
        URLSession.shared.dataTask(with: url) { data, response, error in
            // check if error happens
            if error != nil {
                completion(.failure(.CONNECTION_FAILURE))
            } else if let data = data {
                // Success request
                do {
                    // Decode to Array of post
                    
                    completion(.success(data))
                } catch {
                    // Send error when decoding
                    completion(.failure(.INVALID_DATA))
                }
            } else {
                completion(.failure(.NO_DATA))
            }
        }.resume()
    }
    
}
