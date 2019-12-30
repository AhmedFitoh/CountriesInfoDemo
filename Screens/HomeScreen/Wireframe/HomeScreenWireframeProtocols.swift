//
//  HomeScreenWireframeProtocols.swift
//
//  Created by AhmedFitoh on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Module Constants
struct HomeScreenConstants {
    
    // Uncomment to utilize a navigation contoller from storyboard
    // static let navigationControllerIdentifier = "HomeScreenNavigationController"
    
    static let storyboardIdentifier = "HomeScreen"
    static let viewControllerIdentifier = "HomeScreenView"
}

// VIPER Protocol for communication from Presenter -> Wireframe
protocol HomeScreenPresenterToWireframeProtocol: class {
    func openAddScreen()
    func openCountryDetailsScreen (with country: Country)
    
}
