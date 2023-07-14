//
//  ApiViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import Foundation

class NewsViewModel {
    var onSuccess = Dynamic<[Article]?>(nil)
    var onFailure = Dynamic<Error?>(nil)
    
    func getNews() {
        Task {
            do {
                let news: NewsModel = try await ApiService.shared.get(endpoint: RequestInfo.getNews.path)
                if let articles = news.articles {
                    onSuccess.value = articles
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
