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
    case getNews
}

extension RequestInfo: Endpoint {
    
    var path: String {
        switch self {
        case .getUsers(let page, let perPage, let delay):
            return "api/users?page=\(page)&per_page=\(perPage)&delay=\(delay)"
        case .updateProfile(userId: let userId):
            return "api/users/\(userId)"
        case .login:
            return "api/register"
        case .getNews:
            return "v2/top-headlines?country=us&category=business&apiKey=e4a998b5b52847ab9676f1907648c874"
        }
    }
    
    var url: URL {
        return URL(string: Constants.ApiInfo.baseUrlUserListing + path)!
    }
    
}
