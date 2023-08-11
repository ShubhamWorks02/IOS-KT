//
//  Login.swift
//  URLSession
//
//  Created by Shubham Bhatt on 19/07/23.
//

import Foundation

struct UserLoginRequest: Codable {
    let email, password: String
}

struct UserLoginResponse: Codable {
    let token: String
}
