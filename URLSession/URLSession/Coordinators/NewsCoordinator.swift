//
//  MainCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import Foundation
import UIKit

class NewsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let newsVc = UIStoryboard(name: Constants.StoryBoards.news, bundle: nil).instantiateViewController(withIdentifier: Constants.Vcs.expandableViewController) as? ExpandableViewController {
            newsVc.coordinator = self
            navigationController.pushViewController(newsVc, animated: true)
        }
    }
    
    func gotoExchange() {
        let exchangeCordi = ExchangeCoordinator(navigationController: navigationController, window: window)
        exchangeCordi.start()
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}

