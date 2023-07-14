//
//  RequestInfo.swift
//  URLSession
//
//  Created by Shubham Bhatt on 18/07/23.
//

import Foundation

enum RequestInfo {
    case getUsers(page: Int, perPage: Int = 4, delay: Int = 2)
    case updateProfile(userId: Int)
    case login
}

extension RequestInfo: Endpoint {
    var baseUrl: String {
        return "https://reqres.in/api/"
    }
    
    var path: String {
        switch self {
        case .getUsers(let page, let perPage, let delay):
            return "api/users?page=\(page)&per_page=\(perPage)&delay=\(delay)"
        case .updateProfile(userId: let userId):
            return "users/\(userId)"
        case .login:
            return "login"
        }
    }
    
    var url: URL {
        return URL(string: Constants.ApiInfo.baseUrlUserListing + path)!
    }
    
}
