//
//  HomeCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 14/07/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let homeVc = UIStoryboard(name: Constants.StoryBoards.kt, bundle: nil).instantiateViewController(withIdentifier: Constants.Vcs.homeVc) as? HomeVc {
            homeVc.coordinator = self
            navigationController.pushViewController(homeVc, animated: true)
        }
    }
    
    func goToProfileVc(user: User) {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController, window: window, user: user)
        profileCoordinator.start()
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
}
