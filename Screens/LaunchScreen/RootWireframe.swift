//
//  RootWireframe.swift
//  CountriesInfoDemo
//
//  Created by AhmedFitoh on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class RootWireframe {
    
    lazy var moduleNavigationController: UINavigationController = {
        return UINavigationController()
    }()
    
    // MARK: - Instance Variables
    
    init(onWindow window: UIWindow) {
        showHomeScreen()
        window.rootViewController = moduleNavigationController
        window.makeKeyAndVisible()
    }
  
    
    func showHomeScreen() {
        let homeScreenWireframe = HomeScreenWireframe()
        moduleNavigationController.pushViewController(homeScreenWireframe.viewController, animated: true)
    }
    
    
}
