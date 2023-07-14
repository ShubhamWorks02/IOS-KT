//
//  LoginCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 19/07/23.
//

import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let loginVc = UIStoryboard(name: Constants.StoryBoards.kt, bundle: nil).instantiateViewController(withIdentifier: Constants.Vcs.loginVc) as? LoginVc {
            loginVc.coordinator = self
            navigationController.viewControllers = [loginVc]
        }
    }
    
    func finish() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func goToHomeVc() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, window: window)
        homeCoordinator.start()
    }
    
}
