//
//  NetworkManager.swift
//  Single_User_info
//
//  Created by Koushik Reddy Kambham on 9/12/25.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getData(from serverUrl: String, closure: @escaping (User?) -> Void) {
        
        guard let serverUrl = URL(string: serverUrl) else {
            print("invakid url")
            return
        }
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: serverUrl) { (data, response, error) in
            
            if let error = error {
                print("unabke to fetch data", error)
                return
            }
            
            guard let data = data else {
                print("no data found")
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                closure(user)
            }
            catch {
                print("unable to parse data, \(error)")
            }
        }.resume()
    }
}
