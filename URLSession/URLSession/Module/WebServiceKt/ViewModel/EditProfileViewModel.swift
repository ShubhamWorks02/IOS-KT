//
//  EditProfileViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 05/07/23.
//
import UIKit
import Reachability

class EditProfileViewModel {
    
    var isResponseArrivedSucessfully = Dynamic<Bool>(false)
    
    func editProfileOnServer(userId: Int, userRequest: EditUserRequest) {
        let endPoint = RequestInfo.updateProfile(userId: userId)
        let reachability = try? Reachability()
        if reachability?.connection == .unavailable {
            print(Constants.Strings.connectionError)
            return
        }
        
        Task {
            do {
                let response: EditUserResponse = try await ApiService.shared.patch(endpoint: endPoint.path, data: userRequest)
                print(response.name)
                isResponseArrivedSucessfully.value = true
            } catch {
                isResponseArrivedSucessfully.value = false
                print("\(Constants.Strings.error): \(error)")
            }
        }
    }

}
