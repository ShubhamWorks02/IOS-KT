//
//  ProfileCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 14/07/23.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    var user: User?
    
    init(navigationController: UINavigationController, window: UIWindow, user: User) {
        self.navigationController = navigationController
        self.window = window
        self.user = user
    }
    
    func start() {
        if let profileVc = UIStoryboard(name: Constants.StoryBoards.kt, bundle: nil).instantiateViewController(withIdentifier: Constants.Vcs.profileVc) as? ProfileVc {
            profileVc.coordinator = self
            profileVc.userData = user
            navigationController.pushViewController(profileVc, animated: true)
        }
    }
    
    func finish() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func goToEditProfileVc() {
        if let user = user {
            let editProfileCoordinator = EditProfileCoordinator(navigationController: navigationController, window: window, user: user)
            editProfileCoordinator.start()
        } else {
            print(Constants.Strings.userNotFound)
        }
    }
    
    func goToLoginVc() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController, window: window)
        loginCoordinator.start()
    }
    
}

