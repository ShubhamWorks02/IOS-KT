//
//  ProfileViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 14/07/23.
//

import UIKit
import Reachability

class ProfileViewModel {
    
    var isResponseArrivedSucessfully = Dynamic<Bool>(false)
    
    func showUpdatedProfile(userId: Int) {
        let endPoint = "api/users/\(userId)"
        let reachability = try? Reachability()
        if reachability?.connection == .unavailable {
            print(Constants.Strings.connectionError)
            return
        }
        
        Task {
            do {
                let user: User = try await ApiService.shared.get(endpoint: endPoint)
                isResponseArrivedSucessfully.value = true
            } catch {
                isResponseArrivedSucessfully.value = false
                print("\(Constants.Strings.error): \(error)")
            }
        }
    }

    
}
