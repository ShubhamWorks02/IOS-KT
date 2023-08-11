//
//  AppConstants.swift
//  TableView
//
//  Created by Shubham Bhatt on 19/05/23.
//

import Foundation

struct Constants {
    
    struct Cell {
        static let expandableTableViewCell = "ExpandableTableViewCell"
        static let userTableViewCell = "UserTableViewCell"
    }
    
    struct Vcs {
        static let expandableViewController = "ExpandableViewController"
        static let downloadVc = "DownloadVc"
        static let viewController = "ViewController"
        static let homeVc = "HomeVc"
        static let editProfileVc = "EditProfileVc"
        static let profileVc = "ProfileVc"
        static let loginVc = "LoginVc"
    }
    
    struct StoryBoards {
        static let news = "News"
        static let exchange = "Exchange"
        static let main = "Main"
        static let kt = "Kt"
    }
    
    struct Strings {
        static let userNotFound = "User not found"
        static let connectionError = "No connection"
        static let error = "Error"
        static let invalidEntries = "Invalid Entries"
        static let fieldSuggession = "Please fill in all the fields."
        static let alertActionOk = "OK"
        static let userJobName = "zion resident"
        static let noDataAvailable = "No Data Available"
        static let responseLabel = "Response"
        static let serializedObj = "Serialized JSON object"
        static let serializedError = "Error in serialization"
        static let title = "Title"
        static let description = "Description"
        static let statusCode = "Status Code"
        static let codableError = "Codable error"
    }
    
    struct Navigation {
        static let profileTitle = "Profile"
        static let editProfileTitle = "Edit Profile"
    }
    
    struct Resources {
        static let imgBack = "imgBack"
        static let colorTableTheme = "tableTheme"
        static let camera = "camera"
        static let colorTheme = "themeColor"
        static let imgback2 = "imgback2"
        static let imgTick = "imgTick"
        static let starShotImage = "starShot"
    }
    
    struct ApiInfo {
        static var baseUrlUserListing = "https://reqres.in"
        static let downloadUrl = "https://i.ibb.co/Z6zP5BQ/wallpaperflare-com-wallpaper-12.jpg"
        static let apiInvalidError = "Invalid response"
        static let post = "POST"
        static let patch = "PATCH"
        static let delete = "DELETE"
        static let get = "GET"
        static let put = "PUT"
        static let userListingUrl = "https://reqres.in/api/users?page=2"
        static let downloadCompleted = "Download Completed"
        static let localFile = "file.pdf"
        static let fileMovingError = "Error moving file"
        static let movedFileLocation = "Moved file location"
        static let downloadTaskError = "Download task error"
        static let uploadUrl = "https://api.imgbb.com/1/upload"
        static let afBaseUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e4a998b5b52847ab9676f1907648c874"
    }
    
    struct ProjectInfo {
        static let domain = "com.example.ApiService"
    }
    
}
