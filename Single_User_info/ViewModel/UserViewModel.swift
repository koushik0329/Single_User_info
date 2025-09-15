//
//  UserViewModel.swift
//  Single_User_info
//
//  Created by Koushik Reddy Kambham on 9/12/25.
//

import Foundation



class UserViewModel {
    var user: User?
    
    func getDataFromServer(closure: @escaping (() -> Void)) {
                
        NetworkManager.shared.getData(from: ServerURL.baseURL.rawValue) { [weak self] fetchedUser in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.user = fetchedUser
                    closure()
                }
        }
    }
}
