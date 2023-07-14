//
//  MainCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let mainVc = UIStoryboard(name: Constants.StoryBoards.main, bundle: nil).instantiateViewController(withIdentifier: Constants.Vcs.viewController) as? ViewController {
            mainVc.coordinator = self
            navigationController.pushViewController(mainVc, animated: true)
        }
    }
    
    func gotoNews() {
        let newsCoordi = NewsCoordinator(navigationController: navigationController, window: window)
        newsCoordi.start()
    }
    
    func gotoUpload() {
        let newsCoordi = ExchangeCoordinator(navigationController: navigationController, window: window)
        newsCoordi.start()
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}
