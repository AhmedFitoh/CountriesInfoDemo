//
//  AddScreenWireframe.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class AddScreenWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    // Uncomment to utilize a navigation contoller from storyboard
    // weak var navigationController: UINavigationController?
    
    // MARK:- Life cycle
    init(delegate: AddScreenDelegate? = nil) {
        let storyboard = UIStoryboard(name: AddScreenConstants.storyboardIdentifier, bundle: Bundle(for: AddScreenWireframe.self))
        
        // Uncomment to utilize a navigation contoller from storyboard
        /*
        navigationController = storyboard.instantiateViewController(withIdentifier: AddScreenConstants.navigationControllerIdentifier) as! UINavigationController
        let view = navigationController?.viewControllers[0] as! AddScreenView
        */
        
        // Remove if used navigation controller from storyboard
        let view = (storyboard.instantiateViewController(withIdentifier: AddScreenConstants.viewControllerIdentifier) as? AddScreenView)!
        
        viewController = view
        
        let interactor = AddScreenInteractor()
        let presenter = AddScreenPresenter(wireframe: self, view: view, interactor: interactor, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension AddScreenWireframe: AddScreenPresenterToWireframeProtocol {
    
    
}
