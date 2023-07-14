//
//  EndPoint.swift
//  URLSession
//
//  Created by Shubham Bhatt on 18/07/23.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var url: URL { get }
}
