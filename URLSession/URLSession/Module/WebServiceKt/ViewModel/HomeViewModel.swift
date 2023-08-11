//
//  HomeViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import Foundation
import Reachability

class HomeViewModel {
    
    // MARK: VARIABLES
    var userList = Dynamic<[User]>([])
    private (set) var currentPage = Dynamic(0)
    private (set) var totalPages = Dynamic(0)
    private (set) var isLoadingData = Dynamic(true)
    private var filterUsersList = [User]()
    var isSearching = false
    
    // MARK: API CALL
    func getUsers() {
        currentPage.value += 1
        let endPoint = RequestInfo.getUsers(page: currentPage.value,perPage: 4, delay: 2)
        isLoadingData.value = true
        
        Task {
            do {
                let users: UserData = try await ApiService.shared.get(endpoint: endPoint.path)
                self.totalPages.value = users.totalPages ?? 20
                if let users = users.data {
                    userList.value += users
                    filterUsersList = userList.value
                }
                isLoadingData.value = false
            } catch {
                currentPage.value -= 1
                print("\(Constants.Strings.error): \(error)")
                isLoadingData.value = false
            }
            
        }
       
    }
    
    // MARK: FILTERATION
    func filterUsers(searchQuery: String) {
        isSearching = true
        if searchQuery.isEmpty {
            userList.value = filterUsersList
            return
        }
        userList.value = filterUsersList.filter { user in
            let fullName = user.firstName! + user.lastName!
            return fullName.lowercased().contains(searchQuery.lowercased())
        }
    }
    
}
