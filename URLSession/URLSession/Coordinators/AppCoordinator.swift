//
//  AppCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if (UserManager.shared.isUserLogin) {
            DispatchQueue.main.async {
                let homeCoordinator = HomeCoordinator(navigationController: self.navigationController, window: self.window)
                homeCoordinator.start()
            }
            return
        }
        let loginCoordinator = LoginCoordinator(navigationController: navigationController, window: window)
        loginCoordinator.start()
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}
