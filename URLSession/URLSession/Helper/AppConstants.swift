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
        static let indexTableViewCell = "IndexTableViewCell"
        static let jobCollectionViewCell = "JobCollectionViewCell"
        static let headerCollectionViewCell = "HeaderCollectionViewCell"
        static let demoCollectionViewCell = "DemoCollectionViewCell"
        static let containerTableViewCell = "ContainerTableViewCell"
        static let nestedCollectionViewCell = "NestedCollectionViewCell"
        static let jobDetailCollectionViewCell = "JobDetailCollectionViewCell"
        static let openingTableViewCell = "OpeningTableViewCell"
        static let userTableViewCell = "UserTableViewCell"
    }
    
    struct Vcs {
        static let expandableViewController = "ExpandableViewController"
        static let downloadVc = "DownloadVc"
        static let viewController = "ViewController"
        static let homeVc = "HomeVc"
        static let editProfileVc = "EditProfileVc"
        static let profileVc = "ProfileVc"
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
    }
    
    struct ApiInfo {
        static let baseUrlUserListing = "https://reqres.in"
    }
}
