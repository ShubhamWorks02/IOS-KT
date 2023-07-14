//
//  EditProfileCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 14/07/23.
//

import UIKit

class EditProfileCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var window: UIWindow
    var user: User?
    
    init(navigationController: UINavigationController, window: UIWindow, user: User) {
        self.navigationController = navigationController
        self.window = window
        self.user = user
    }
    
    func start() {
        if let editProfileVc = UIStoryboard(name: Constants.StoryBoards.kt, bundle: nil).instantiateViewController(withIdentifier: Constants.Vcs.editProfileVc) as? EditProfileVc {
            editProfileVc.coordinator = self
            editProfileVc.userData = user
            navigationController.pushViewController(editProfileVc, animated: true)
        }
    }
    
    func popToProfileVc() {
        navigationController.popViewController(animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
    func goToLoginVc() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController, window: window)
        loginCoordinator.start()
    }
}
