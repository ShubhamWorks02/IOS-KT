//
//  LoginViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 19/07/23.
//

import Foundation

class LoginViewModel {
    
    var isTokenArrived = Dynamic(false)
    
    // MARK: API CALL
    func login(email: String, password: String) {
        let loginRequest = UserLoginRequest(email: email, password: password)
        let endPoint = RequestInfo.login
        Task {
            do {
                let response: UserLoginResponse = try await ApiService.shared.post(endpoint: endPoint.path, data: loginRequest)
                print(response.token)
                self.isTokenArrived.value = true
            } catch {
                print("\(Constants.ApiInfo.apiInvalidError): \(error)")
            }
        }
    }
}
