//
//  Product.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import Foundation

// MARK: - UsersData
struct UserData: Codable {
    let page, perPage, total, totalPages: Int?
    let data: [User]?
    let support: Support?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String?
    let text: String?
}

